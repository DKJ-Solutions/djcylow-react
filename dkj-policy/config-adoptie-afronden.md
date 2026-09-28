## config/adoptie-afronden

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

De vier punten die na #171 openstonden, op Dave's woord ("de hele reeks", 2026-09-28).

### CREATE

- [x] `Get-ExpectedRepoSettings`: zes GitHub-instellingen verklaard, nagemeten via de API
- [x] adoptie Part 5: `.claude/statusline/dkj-progress.ps1` en de `statusLine` in `.claude/settings.json`
- [x] deny- en ask-lijst en de marketplace-verwijzing terug in `.claude/settings.json`
- [x] oud PR-sjabloon vervangen door dat van adoptie Part 1; `scripts/task/shared.ps1` verwijderd
- [x] verwijzing naar het oude `CONTRIBUTING.md` uit `scripts/add-mix.js` gehaald

### TEST

- [x] `check-repo-settings.ps1`: 6 van 6 instellingen komen overeen met GitHub
- [x] lint-poort en testsuite via `open-pr`

### DEPLOY: config/adoptie-afronden

De adoptie van dkj-policy is af, op Part 3 na, dat wacht op de verhuizing naar DKJ-Solutions. De
beschermde bestanden (`next.config.ts`, `netlify.toml`, `public/images/`) en het verbod op
force-push, `reset --hard`, `rebase` en `gh repo delete` staan weer in `.claude/settings.json`,
na één dag zonder. Zes GitHub-instellingen, waaronder de ruleset `main-ci-gate`, zijn nu verklaard,
zodat een drift gemeld wordt in plaats van onopgemerkt te blijven.

**Score:** 3

#### What makes this deploy extra special

N/A: alleen de werkomgeving en configuratie; `djcylow.com` levert dezelfde pagina's.

**Score:** N/A

#### Pull Request

Adoptie afgerond: bewaakte repo-instellingen, voortgangsbalk, beveiligingsregels terug

