## config/repo-naar-dkj-solutions

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

De repo is op GitHub overgedragen van `DaveKJohn` naar de organisatie `DKJ-Solutions`; de lokale `origin` is al omgezet. Deze branch zet het enige repo-feit dat de eigenaar noemt mee.

### CREATE

- [x] `scripts/repo-config.ps1`: `$script:RepoName` naar `DKJ-Solutions/djcylow-react`

### TEST

- [x] `Get-RepoName` geeft `DKJ-Solutions/djcylow-react` terug

### DEPLOY: config/repo-naar-dkj-solutions

De repo woont nu onder de organisatie `DKJ-Solutions` in plaats van onder het persoonlijke account `DaveKJohn`. `Get-RepoName` wijst daarom naar `DKJ-Solutions/djcylow-react`, zodat de workflowscripts hun `gh`-aanroepen op het nieuwe adres doen in plaats van op de redirect van GitHub te leunen. Oude links blijven werken dankzij die redirect; historische changelog-regels zijn bewust niet herschreven.

**Score:** 2

#### What makes this deploy extra special

N/A -- de website en wat bezoekers zien veranderen niet; alleen waar de broncode staat.

**Score:** N/A

#### Pull Request

repo verhuisd naar DKJ-Solutions

