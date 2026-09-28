## config/adopt-config

> **How this file is read.** A step is `- [ ]` until it is resolved -- `- [x]` done, or
> `- [~]` dropped with the reason, which exists so nobody ticks a box for work they did not do.
> open-pr and ship-pr both refuse while one is still open, and there is no `-Force`.
>
> **FOUR `###` HEADINGS, AND NEVER A FIFTH** -- PLAN, CREATE, TEST, DEPLOY are the whole top
> level. A section needing its own heading goes in as a `####` UNDER whichever of the four owns
> it. No gate in YOUR repo reads a heading, so this half is on you -- only the repo that authors
> this workflow refuses a fifth (Dave, August 26, 2026).
>
> **AND NOTHING BRANCH-SPECIFIC ABOVE THE FIRST OF THOSE FOUR HEADINGS** -- everything between the
> title and it is this guidance, which is identical in every branch document. A status line, a note about
> THIS branch or an instruction to a session belongs under one of the four, normally as a `####`
> in PLAN. THIS half open-pr refuses, in every repo, before the push -- it reads the shape, so a
> guidance block in your own language passes and your own paragraph here does not (Dave,
> August 26, 2026; refused since #1650).
>
> **DEPLOY takes no steps of its own, and it is WRITTEN LAST** -- it is what the branch DID, once
> TEST says so. Written while steps above it are still open it states an INTENTION, and no gate
> holds it against what landed: the step gate splits this file at that heading and counts only
> above it. The PR title is the one exception -- new-branch -Title writes it at creation, because
> open-pr composes the PR title from it. It is the one part of this file that travels verbatim
> into `CHANGELOG.md` at the merge. In each tier, write the reason
> ABOVE the Score line -- anything below it is discarded.
>
> Relative links in that text resolve FROM THIS DIRECTORY -- `CHANGELOG.md` sits here too, so
> write each path exactly as it reads in this file.
>
> For tier 1 audiences: management and the employer/commissioner -- this repo is a means of selling or delivering something else. That reader and nobody else -- what matters only
> inside this repo belongs under the first `**Score:**`. If the change reaches that reader
> not at all, N/A is a complete answer and the common one. **One hop and no further:** where that
> reader is itself a business, ITS own customers sit one hop past this repo and are never the reader
> here -- they take nothing this repo ships. Name the party that runs the upgrade, and score
> against them.
>
> The phase arc, the marks and the whole form: `DEVELOPMENT-portable.md`, which ships
> with this workflow.

### PLAN

Part 2 van `adopt-dkj-policy` na de schone lei van #170, met Dave's antwoorden op de
repo-eigen vragen (2026-09-28).

### CREATE

- [x] `adopt-config -Apply`: vijf gedeelde instellingen geplaatst in `scripts/repo-config.ps1`
- [x] elf `decide`-vragen beantwoord, onder andere `Get-CiTestCheckName` = `poort` en `Get-ReleasePageTitle` = `DJ Cylow`
- [x] `adopt-ci-floor` vastgelegd als afgewezen tot de verhuizing naar DKJ-Solutions (`FOLD_PUSH_TOKEN`)
- [x] `config-adoption-proposal.md` verwijderd, want die is doorgewerkt
- [~] `Get-ExpectedRepoSettings` -- open gelaten: de waarden moeten eerst bij GitHub worden nagemeten

### TEST

- [x] `check-script-contract.ps1`: 0 fouten, alleen `Get-ExpectedRepoSettings` en Part 5 staan nog open
- [x] lint-poort en testsuite via `open-pr`

### DEPLOY: config/adopt-config

De gedeelde workflow-scripts draaien in deze repo nu op antwoorden die hier gekozen zijn, in plaats
van op fallbacks die niemand koos: de verplichte CI-check (`poort`), de merge-methode, de naam op de
release-pagina (`DJ Cylow`) en de regel voor wanneer een major mag. Part 3 van de adoptie staat bewust
uit tot de repo naar DKJ-Solutions verhuist, omdat de runners daar pas bij `FOLD_PUSH_TOKEN` kunnen.

**Score:** 2

#### What makes this deploy extra special

N/A: alleen configuratie van de werkwijze; `djcylow.com` levert dezelfde pagina's.

**Score:** N/A

#### Pull Request

Adoptie Part 2: de configuratie van dkj-policy

