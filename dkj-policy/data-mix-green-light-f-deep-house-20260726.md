## data/mix-green-light-f-deep-house-20260726

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

Nieuwe mix: Deep House, Green Light (f), 128 BPM, 2026-07-26. De mp3 staat op de actieve R2-bucket als
`Green_Light_f_EDM_128BPM_20260726_Audio_V1 (Vol. 4).mp3` (HEAD-request: 200, audio/mpeg, ~145 MB).

#### Volume: Vol. 4 op verzoek van Dave

De spec telt `volume` per subgenre, wat hier Vol. 1 zou geven (eerste Deep House in Green Light (f)).
Dave koos Vol. 4, gelijk aan `volume_spotify` en de audiobestandsnaam, dus doorgeteld over de hele
Green Light (f) 128-serie. De README noemt dat telpatroon al als bestaande praktijk in dertien series.

#### Zonder tracklist live, op verzoek van Dave

De tracklist komt later. De entry staat live met `tracklist: []`, `tracks: 0` en `top_artists: []`;
de pagina toont dan "Geen tracklist beschikbaar". De beschrijvingen en tags zijn geschreven zonder de
mix gehoord te hebben en noemen daarom geen specifieke tracks.

### CREATE

- [x] Cover uit `H:\1) Music Mood Colours\...\20260726 (Vol. 4)\Thumb\Wide` (1920x1080 JPG) omgezet
      met sharp naar `image_light_green_wide_20260726_large.webp` (1920x1080, q90) en `_small.webp`
      (480x270, q90) in `public/images/light/green/wide/`
- [x] Entry `20260726` bovenaan `src/data/mixes/light-green.json`
- [x] Ratchet `liveMixen` in `tests/mix-data.test.ts` van 77 naar 78
- [~] Tracklist, `tracks` en `top_artists`: overgeslagen op verzoek van Dave, volgt in een aparte branch

### TEST

- [x] `npm test` groen (213 tests)
- [x] Mixpagina lokaal: 200, titel "Green Deep House Mix Vol. 4 | DJ Cylow", cover laadt, "Geen tracklist beschikbaar"
- [ ] Dave heeft de pagina bekeken en goedgekeurd

### DEPLOY: data/mix-green-light-f-deep-house-20260726

Nieuwe mix-entry voor de Deep House-mix in Green Light (f), 128 BPM, van 26 juli 2026, met cover en
audio. De live-ratchet gaat van 77 naar 78 mixen. De tracklist ontbreekt nog en volgt later.

**Score:** 2

#### What makes this deploy extra special

Er staat een nieuwe mix op de site: Deep House, Green Light (f), Vol. 4, af te spelen op de Luister-pagina
en met een eigen mixpagina. Nog zonder tracklist.

**Score:** 3

#### Pull Request

nieuwe mix: Deep House, Green Light (f), 26 juli 2026
