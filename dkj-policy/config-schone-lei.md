## config/schone-lei

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

Op Dave's verzoek: een schone lei voor de Claude-werkwijze in deze repo, met behoud van de
release-historie.

### CREATE

- [x] `CLAUDE.md` geleegd, root-`README.md` en heel `.claude/` verwijderd
- [x] `dkj-policy`, `dkj-subagents-alpha` en `figma` op project-scope verwijderd en opnieuw geïnstalleerd
- [x] `contributing-davekjohn/` met `git mv` naar `dkj-policy/`; `releases/README.md` hernoemd naar `releases/history.md`
- [x] `CONTRIBUTING.md` en `README.md` van de oude map verwijderd (door Dave)
- [x] `history.md` teruggebracht tot titel plus de 40 versierijen
- [x] paden in `scripts/repo-config.ps1` naar `dkj-policy/`
- [x] `check-links.ps1` bestand tegen een leeg markdownbestand, en drie dode links hersteld
- [x] adoptie Part 1: `branch-entry.yml`, `always-on-budget.yml` en de grondwet-import in `CLAUDE.md`

### TEST

- [x] `scripts/lint/lint-web.ps1` groen: 0 fouten, 89 statische pagina's, geen dode links
- [x] `npm test` groen: 16 suites, 213 tests

### DEPLOY: config/schone-lei

De oude, repo-eigen Claude-werkwijze is weg: `CLAUDE.md` bevat alleen nog de import van de
dkj-policy-grondwet, `.claude/` alleen de plugin-instellingen, en de root-`README.md` is verwijderd.
De release-historie is bewaard en staat nu in `dkj-policy/`, met het overzicht als
[`releases/history.md`](releases/history.md), zoals bij de andere consumers. De site zelf verandert niet.

**Score:** 4

#### What makes this deploy extra special

N/A: dit raakt alleen hoe er aan de repo gewerkt wordt; `djcylow.com` levert dezelfde pagina's.

**Score:** N/A

#### Pull Request

Schone lei: oude werkwijze weg, plugins opnieuw geïnstalleerd, release-historie naar dkj-policy/

