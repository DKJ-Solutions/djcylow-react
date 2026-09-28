<#
    dkj-policy statusline shim -- placed by adopt-statusline.ps1 (issue #2103). DO NOT EDIT.

    It exists so .claude/settings.json can name a path that never changes. The script it hands over to
    lives in the dkj-policy plugin payload, whose cache directory is keyed by VERSION -- so a path
    written straight into settings.json would go on rendering the version installed the day it was
    written, silently, forever. This file resolves the CURRENT payload instead, every time it runs.

    It reads the install administration itself rather than through check-report-lib's
    Get-InstallRecord, because that lib lives in the payload this file is looking for.

    IT NEVER THROWS AND ALWAYS EXITS 0. A status line runs every couple of seconds for as long as a
    session is open, so a failure here is not an error report -- it is a broken status line, repeated
    forever. Every failure path means "print nothing".
#>
$ErrorActionPreference = 'SilentlyContinue'

try {
    # Read the session payload HERE and hand it over as a parameter: the harness pipes it to this
    # process, so the script we call would otherwise find an already-drained stdin.
    #
    # BOUNDED, because a redirected handle nobody closes blocks forever and this runs every couple of
    # seconds -- one more wedged process per refresh, none of which prints anything (#2249). It is
    # written this way rather than with [Console]::In's own async methods because those belong to a
    # SyncTextReader, which overrides them to run synchronously on the calling thread, so a Wait()
    # after them is never reached. Get-HookPayloadRaw in the payload's session-cache-lib.ps1 is the
    # canonical copy and carries the measurement; the shim cannot dot-source it for the same reason it
    # reads installed_plugins.json itself -- that lib lives in the payload this file is looking for.
    $payload = ''
    if ([Console]::IsInputRedirected) {
        $sink = New-Object System.IO.MemoryStream
        if (([Console]::OpenStandardInput().CopyToAsync($sink)).Wait(1000)) {
            $sink.Position = 0
            $payload = (New-Object System.IO.StreamReader($sink, [System.Text.Encoding]::UTF8, $true)).ReadToEnd()
        }
    }

    $userHome = ''
    foreach ($candidate in @($env:USERPROFILE, $env:HOME)) {
        if ($candidate) { $userHome = $candidate; break }
    }
    if (-not $userHome) { exit 0 }

    $adminPath = Join-Path $userHome '.claude\plugins\installed_plugins.json'
    if (-not (Test-Path -LiteralPath $adminPath -PathType Leaf)) { exit 0 }

    $admin = Get-Content -LiteralPath $adminPath -Raw -Encoding UTF8 | ConvertFrom-Json
    if (-not $admin -or -not $admin.plugins) { exit 0 }

    # This repo, normalized the way the records are, so a trailing separator or a different spelling
    # of the same path cannot make this repo's record look like somebody else's.
    $here = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path.TrimEnd('\', '/')

    # A PROJECT RECORD FOR THIS REPO FIRST, A PATHLESS ONE SECOND. A user-scope install carries no
    # projectPath and still serves this repo; a project record for SOMEBODY ELSE'S repo never does.
    #
    # THE MATCH IS ON THE PLUGIN NAME AND NOT ON THE WHOLE ID, DELIBERATELY. An id is
    # '<plugin>@<marketplace>', and the marketplace half is exactly the part that has changed under
    # this repo before -- so pinning the full id would strand every consumer whose marketplace is
    # named anything else, which is the staleness this whole file exists to avoid, arriving through
    # the matcher instead of through the path. ('dkj-policy-bwj@...' does not match: the character
    # after the name has to be the '@'.)
    #
    # WHICH MAKES SEVERAL MATCHES POSSIBLE, AND THAT IS THE CASE TO GET RIGHT. A marketplace rename
    # leaves a stale 'dkj-policy@<old>' record beside the current one, both naming this repo --
    # check-report-lib's Get-InstallRecord documents that exact pair as real and hands back ALL of
    # them so a caller can see the disagreement. This file cannot do that: its contract is to print
    # nothing and never report. So it collects every candidate and takes the most recently updated,
    # rather than whichever the enumeration happened to reach first -- an order nothing controls,
    # which is how a machine would render a stale payload permanently with no signal.
    $matched  = @()
    $pathless = @()
    foreach ($entry in @($admin.plugins.PSObject.Properties)) {
        if ("$($entry.Name)" -notlike 'dkj-policy@*') { continue }
        foreach ($record in @($entry.Value)) {
            if (-not $record -or -not $record.installPath) { continue }
            $projectPath = "$($record.projectPath)".TrimEnd('\', '/')
            if (-not $projectPath) { $pathless += $record; continue }
            if ($projectPath -eq $here) { $matched += $record }
        }
    }
    $candidates = @(if ($matched.Count) { $matched } else { $pathless })
    if (-not $candidates.Count) { exit 0 }

    $best = @($candidates | Sort-Object -Property @{ Expression = {
        # lastUpdated first, installedAt behind it: an update rewrites the first and leaves the
        # second at the original install. An unparseable or absent stamp sorts oldest, which is the
        # safe direction -- it loses a tie rather than winning one.
        $stamp = [datetime]::MinValue
        foreach ($field in @($_.lastUpdated, $_.installedAt)) {
            if ($field -and [datetime]::TryParse("$field", [ref]$stamp)) { break }
        }
        $stamp
    } } -Descending)[0]
    if (-not $best) { exit 0 }

    $target = Join-Path "$($best.installPath)" 'scripts\task\show-progress.ps1'
    if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { exit 0 }

    # IN-PROCESS, NOT A SUBPROCESS. show-progress.ps1's own header makes costing no process spawn the
    # point of the file, and a shim that spawned one would hand back exactly the cost it removed.
    & $target -Payload $payload
} catch { }

exit 0