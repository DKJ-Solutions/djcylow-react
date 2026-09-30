## data/tracklist-green-light-f-20260726

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

Vervolg op #175: de mix-entry `20260726` (Deep House, Green Light (f), Vol. 4) ging live zonder
tracklist. Dave leverde de tracklist aan als
`Green_Light_f_EDM_128BPM_20260726_Audio_V1 (Vol. 4).txt` (de YouTube-beschrijving), naast de audio op `H:`.

#### Tracks letterlijk overgenomen

De 29 regels zijn woordelijk uit het tekstbestand gehaald, inclusief de schrijfwijze van `ft.`, `w` en
`x` tussen artiesten. Herschrijven naar de spec-vorm (`(ft. ...)` achter de titel) zou afwijken van de
gepubliceerde tekst, en de tests eisen alleen `HH:MM:SS` en ` - `, waar alle 29 aan voldoen.

#### top_artists

Kaskade, Ben Böhmer en Shingo Nakamura: de drie bekendste namen in de lijst, gekozen op bekendheid
zoals de spec vraagt, gespeld zoals in de tracklist.

### CREATE

- [x] `tracklist` (29 tracks, `00:01:00` t/m `00:56:49`), `tracks: 29` en `top_artists` ingevuld in
      entry `20260726` van `src/data/mixes/light-green.json`; de rest van het bestand is byte-gelijk

### TEST

- [x] `npm test` groen (213 tests)
- [x] Mixpagina lokaal (`/luister/mix/green-light-f-edm-128bpm-20260726`): 200, eerste en laatste track
      staan erop, "Geen tracklist beschikbaar" is weg
- [x] Dave heeft de pagina bekeken en goedgekeurd

### DEPLOY: data/tracklist-green-light-f-20260726

De Deep House-mix in Green Light (f), Vol. 4, van 26 juli 2026 heeft nu zijn tracklist: 29 tracks met
tijden, plus Kaskade, Ben Böhmer en Shingo Nakamura als top-artiesten.

**Score:** 2

#### What makes this deploy extra special

Bezoekers van de mixpagina zien nu welke tracks er in de mix zitten, en de artiestnamen worden
doorzoekbaar voor zoekmachines.

**Score:** 2

#### Pull Request

tracklist voor Deep House, Green Light (f), 26 juli 2026

