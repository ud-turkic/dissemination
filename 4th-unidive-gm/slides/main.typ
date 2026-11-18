#import "@preview/touying:0.6.1": *
#import themes.university: *
#import "@preview/unidep:0.1.4": dependency-tree
#import "@preview/tiaoma:0.3.0": qrcode

// ============================================================
// UD Turkic Group — 4th UniDive General Meeting
// Bucharest, 27 August 2026 · oral presentation (20 min + 5 Q&A)
// Presenter: Bermet Chontaeva
// Build: make   (or: typst compile --font-path fonts/ main.typ)
// ============================================================

#let ud_blue = rgb("#1F4E79")
#let ud_gold = rgb("#B8860B")
#let ud_red = rgb("#C1272D")
#let ud_green = rgb("#2E7D32")
#let grey = rgb("#5A5A5A")

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [From variation to harmonization:\ the UD Turkic Group initiative],
    short-title: [UD Turkic Group],
    subtitle: [4th UniDive General Meeting · Bucharest],
    author: [UD Turkic Group],
    date: [27 August 2026],
    institution: [WG1 · WG4],
  ),
  config-colors(
    primary: ud_blue,
    secondary: rgb("#2E6DA4"),
    tertiary: ud_gold,
  ),
  // default footer-a is the author, which duplicates the short-title in the
  // middle cell; show the venue on the left instead
  footer-a: [UniDive 2026 · Bucharest],
  // no speaker notes in this deck, so skip the pdfpc metadata touying emits
  config-common(enable-pdfpc: false),
)

#set text(font: "Fira Sans", size: 19pt)
#show link: it => text(fill: ud_blue, it)

// ---------- helpers ----------

#let tag(body, fill: ud_blue) = box(
  fill: fill.lighten(85%),
  stroke: (paint: fill.lighten(40%), thickness: 0.6pt),
  radius: 3pt,
  inset: (x: 5pt, y: 2pt),
  text(size: 0.8em, fill: fill.darken(10%), weight: "medium", body),
)

#let cite_note(body) = text(size: 0.75em, fill: grey, style: "italic", body)

#let takeaway(body) = block(
  width: 100%,
  fill: ud_gold.lighten(90%),
  stroke: (left: (paint: ud_gold, thickness: 3pt)),
  inset: (x: 12pt, y: 9pt),
  radius: (right: 4pt),
  text(size: 0.92em, body),
)

// unidep renders at a fixed base scale, so shrink to slide size with
// scale(reflow: true) rather than by setting the font size.
// Geometry is deliberately tight: the arcs are scaffolding, the words and
// relation labels are the content, so keep the text large relative to the
// space the tree occupies.
#let tree(src, zoom: 72%) = align(center)[
  #scale(x: zoom, y: zoom, reflow: true)[
    #set text(size: 17pt)
    #dependency-tree(
      src,
      show-text: true,
      show-upos: true,
      word-spacing: 4.0,
      level-height: 1.5,
      arc-roundness: 0.26,
      tail-spacing: 0.4,
      head-spacing: 0.16,
    )
  ]
]

// ============================================================

#title-slide(
  authors: [
    Soudabeh Eslami#super[1] · *Bermet Chontaeva*#super[1] · Furkan Akkurt#super[2]\
    Çağrı Çöltekin#super[1] · Nikolett Mus#super[3] · Jonathan Washington#super[4]
    #v(0.3em)
    #text(size: 0.72em, fill: grey)[
      #super[1]University of Tübingen · #super[2]Boğaziçi University ·
      #super[3]ELTE Research Centre for Linguistics · #super[4]Swarthmore College
    ]
    #v(1em)
    #align(center)[
      #grid(columns: 3, column-gutter: 20pt, align: horizon,
        image("images/unidive.png", height: 1.2cm),
        image("images/cost.jpg", height: 1.2cm),
        image("images/eu.png", height: 1.2cm),
      )
    ]
  ],
)

== Outline <touying:hidden>

#components.adaptive-columns(outline(title: none, indent: 1em, depth: 1))

// ============================================================
= The UD Turkic Group

== Who we are

// densest slide in the deck: hold it just under the 19pt global size so the
// funder/aims block and the v2.18 counts stay on one page
#set text(size: 0.94em)

#grid(columns: (1.35fr, 1fr), gutter: 26pt)[
  Established *September 2023* within the UniDive COST Action (CA21167),
  under *WG1*, Task 1.3.2 — harmonisation of UD annotations for Turkic
  languages.

  #v(0.5em)
  *Two aims*
  #v(0.2em)
  + Harmonize annotations across existing Turkic UD treebanks.
  + Develop guidelines for future annotation initiatives.

  #v(0.6em)
  #tag[WG1 Corpus annotation] #h(4pt)
  #tag(fill: ud_gold)[WG4 Quantifying and promoting diversity]
][
  #block(fill: ud_blue.lighten(94%), radius: 6pt, inset: 13pt, width: 100%)[
    #text(weight: "bold", fill: ud_blue)[Turkic in UD v2.18]
    #v(0.35em)
    #set text(size: 0.9em)
    #grid(columns: (auto, 1fr), row-gutter: 0.45em, column-gutter: 8pt,
      text(size: 1.5em, weight: "bold", fill: ud_blue)[26], [treebanks],
      text(size: 1.5em, weight: "bold", fill: ud_blue)[10], [languages\ and varieties],
      text(size: 1.5em, weight: "bold", fill: ud_blue)[2], [code-switching\ corpora],
    )
    #v(0.35em)
    #cite_note[out of some *40* Turkic languages]
  ]
]

#v(0.5em)
#takeaway[
  Turkic languages share typologically and genetically grounded features —
  but these are *not always analysed uniformly* across treebanks.
]

== Coverage across the family

#set text(size: 0.92em)

#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, center),
  inset: (x: 9pt, y: 7pt),
  fill: (_, y) => if y == 0 { ud_blue.lighten(88%) } else if calc.odd(y) { rgb("#FAFAFC") },
  table.header([*Branch*], [*Languages in UD*], [*Note*]),
  [Oghuz], [Turkish, Ottoman Turkish, Azerbaijani], [best resourced],
  [Karluk], [Uzbek, Uyghur], [small],
  [Kypchak], [Kazakh, Kyrgyz, Tatar], [small],
  [Lena Turkic], [Sakha], [small],
  [—], [Old Turkic], [historical],
  [—], [Turkish–German (SAGT), Turkish–English (BUTR)], [code-switching],
)

#v(0.4em)

#grid(columns: (1fr, 1fr), gutter: 20pt)[
  #block(fill: ud_green.lighten(92%), radius: 5pt, inset: 11pt, width: 100%)[
    *Turkish alone* — 10 treebanks, roughly 730,000 tokens.
    News, web text, grammar examples, dictionary entries, tourism reviews,
    spoken data.
  ]
][
  #block(fill: ud_red.lighten(93%), radius: 5pt, inset: 11pt, width: 100%)[
    *Everything else* — usually 1–2 treebanks, often under 10,000 tokens.
    Several consist of only a few hundred sentences.
  ]
]

== Where the variation comes from

#grid(columns: (1fr, 1fr), gutter: 24pt)[
  *Three sources*

  #v(0.3em)
  - Unresolved questions in *linguistic analysis*.
  - Independent *design choices* across annotation efforts.
  - Differing degrees of *grammaticalization* of the same structure across
    the family.

  #v(0.45em)
  All three are amplified by differing linguistic traditions and by gaps in
  language-specific description.

  #v(0.45em)
  And the inconsistency is not only *between* treebanks — many are
  inconsistent *internally* as well.
][
  *Divergences we have worked on*

  #v(0.3em)
  - Copula tokenization and lemmatization\
    #cite_note[even the major Turkish treebanks are mutually inconsistent]
  - Morphological analysis of auxiliaries
  - Treatment of pronominal locative constructions
  - Varying morphological feature inventories

  #v(0.4em)
  #cite_note[Many further divergences are known; these are the ones the group
  has spent substantial time on.]
]

#v(0.7em)
#takeaway[
  Phenomena at the *morphology–syntax interface* pose the hardest annotation
  problems — and that is where the group has concentrated.
]

// ============================================================
= How the group works

== Methodology

#grid(columns: (1fr, 1.1fr), gutter: 24pt)[
  *Continuous*

  Regular online meetings, with subgroups formed for specific tasks:

  #v(0.25em)
  - mapping annotation inconsistencies
  - surveying relevant linguistic literature
  - formulating research questions to guide harmonization
  - building consensus across a group with diverse linguistic traditions
][
  *Two in-person workshops*

  #v(0.4em)
  #block(fill: ud_blue.lighten(94%), radius: 5pt, inset: 11pt, width: 100%)[
    *Istanbul, September 2023* — inaugural UD Turkic Workshop, co-located with
    the UniDive 2nd WG3 meeting. Reviewed existing treebanks, identified
    inconsistencies, set a shared research agenda.
  ]
  #v(0.35em)
  #block(fill: ud_blue.lighten(94%), radius: 5pt, inset: 11pt, width: 100%)[
    *Ljubljana, August 2025* — held alongside SyntaxFest 2025. Ongoing
    annotation work and parallel treebank projects; consolidation of practices.
  ]
]

// ============================================================
= Research topics and outputs

== Four strands of work

#set text(size: 0.95em)

#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left + horizon, left + horizon, left + horizon),
  inset: (x: 9pt, y: 9pt),
  fill: (_, y) => if y == 0 { ud_blue.lighten(88%) } else if calc.odd(y) { rgb("#FAFAFC") },
  table.header([*Topic*], [*Proposal*], [*Venue*]),
  [Pronominalized\ locatives],
  [Segment pronominal _-ki_ as a subword token; nominal POS on _-ki_],
  [MWE-UD 2024\ #cite_note[May, LREC-COLING, Turin]],

  [Parallel\ treebanks],
  [Sentence-aligned UD treebanks for direct cross-linguistic comparison],
  [UDW 2025\ #cite_note[Aug, SyntaxFest, Ljubljana]],

  [Copula\ tokenization],
  [Unified tokenization strategy grounded in cross-linguistic evidence],
  [SIGTURK 2026\ #cite_note[Mar, EACL, Rabat]],

  [Non-verbal\ negation],
  [Negator is `ADV` with `advmod:neg`, not an auxiliary or copula],
  [UDW 2026\ #cite_note[May, Palma de Mallorca]],
)

#v(0.4em)
#cite_note[Not an exhaustive map of the problem space — these are the four
strands the group has pursued in depth.]

== Worked example: non-verbal negation

// the trees are the point of this slide, so keep the prose around them small
#set text(size: 0.94em)

Across Turkish, Azerbaijani and Kyrgyz, the negative element in non-verbal
clauses *cannot* consistently be analysed as an auxiliary or copula.

#v(0.35em)

#grid(columns: (1fr, 1fr), gutter: 18pt)[
  #align(center)[#text(weight: "bold", fill: ud_blue, size: 0.9em)[No overt copula]]
  #v(0.2em)
  #tree(```
# text = Deniz doktor değil.
1	Deniz	Deniz	PROPN	_	_	2	nsubj	_	_
2	doktor	doktor	NOUN	_	_	0	root	_	_
3	değil	değil	ADV	_	_	2	advmod:neg	_	_
4	.	.	PUNCT	_	_	2	punct	_	_
```.text)
  #align(center)[#cite_note['Deniz is not a doctor.']]
][
  #align(center)[#text(weight: "bold", fill: ud_blue, size: 0.9em)[With overt copula]]
  #v(0.2em)
  #tree(```
# text = Ben doktor değilim.
1	Ben	ben	PRON	_	_	2	nsubj	_	_
2	doktor	doktor	NOUN	_	_	0	root	_	_
3	değil	değil	ADV	_	_	2	advmod:neg	_	_
4	im	i	AUX	_	_	2	cop	_	_
5	.	.	PUNCT	_	_	2	punct	_	_
```.text)
  #align(center)[#cite_note['I am not a doctor.']]
]

#v(0.3em)
#takeaway[
  Treating _değil_ as `ADV` + `advmod:neg`
  #v(0.2em)
  #set text(size: 0.95em)
  - separates the negator from the copula,
  - keeps Oghuz and Kypchak comparable,
  - preserves Kyrgyz scope contrasts.
]

== Parallel Universal Dependencies treebanks

#grid(columns: (1fr, 1fr), gutter: 24pt)[
  Sentence-aligned UD treebanks enabling *direct cross-linguistic comparison* —
  and a testing ground for harmonized annotation strategies.

  #v(0.6em)
  #text(weight: "bold", fill: ud_green)[Published]
  #v(0.15em)
  Azerbaijani · Kyrgyz · Ottoman Turkish · Turkish · Uzbek

  #v(0.5em)
  #text(weight: "bold", fill: ud_gold)[In progress]
  #v(0.15em)
  Crimean Tatar · Karachay–Balkar · Karakalpak · Kumyk · Sakha · Tatar

  #v(0.5em)
  #text(weight: "bold", fill: grey)[Planned]
  #v(0.15em)
  Kazakh · Turkmen · Uyghur
][
  #block(fill: ud_blue.lighten(94%), radius: 6pt, inset: 14pt, width: 100%)[
    #set text(size: 0.9em)
    Aligned at the *sentence level*, so the same content can be compared
    across the family — including where the languages reach for *different
    constructions* to express it.

    #v(0.5em)
    Those mismatches have proved as informative as the parallels: for all the
    family resemblance, the differences are not rare.

    #v(0.5em)
    This is the group's main *resource* contribution, as opposed to its
    guideline contributions.

    #v(0.5em)
    #cite_note[Akhundjanova et al. (2025), UDW at SyntaxFest, Ljubljana]
  ]
]

// ============================================================
= Impact on UD treebanks

== The question we should be asking

#v(0.3em)

#block(
  width: 100%,
  fill: ud_blue.lighten(94%),
  stroke: (left: (paint: ud_blue, thickness: 3pt)),
  radius: (right: 5pt),
  inset: (x: 16pt, y: 14pt),
)[
  #text(size: 1.05em)[
    Have treebanks *outside the group's direct control* adopted the analyses
    we proposed?
  ]
]

#v(0.7em)

The TueCL treebanks are maintained by group members, so they naturally reflect
current recommendations. Uptake in *independently maintained* treebanks is what
actually measures the group's reach.

#v(0.7em)

*What we checked* — annotation practices and commit histories of

#v(0.3em)
#align(center)[
  #tag[Turkish-BOUN] #h(3pt) #tag[Turkish-IMST] #h(3pt)
  #tag[Ottoman Turkish-BOUN] #h(3pt) #tag[Kyrgyz-KTMU] #h(3pt) #tag[Tatar-NMCTT]
]

#v(0.4em)
#align(center)[#cite_note[against the three main proposals]]

== What we found

#set text(size: 0.88em)

#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left + horizon, left + horizon, center + horizon),
  inset: (x: 9pt, y: 10pt),
  fill: (_, y) => if y == 0 { ud_blue.lighten(88%) } else if calc.odd(y) { rgb("#FAFAFC") },
  table.header([*Proposal*], [*Practice in independent treebanks*], [*Adopted?*]),

  [Pronominalized\ locatives],
  [Most _do_ segment the forms, but assign entirely different tags:
   BOUN `PART` + `dep:der`; IMST and PUD `ADP` + `case`; GB a mix of `ADP` and
   `SCONJ`. No non-TueCL treebank uses the proposed nominal analysis.],
  [#text(fill: ud_red, weight: "bold")[No]],

  [Copula\ tokenization],
  [Turkish-BOUN and Turkish-IMST have long-standing but mutually inconsistent
   practices (e.g. different copula lemmas). Neither has adopted the unified
   policy.],
  [#text(fill: ud_red, weight: "bold")[No]],

  [Non-verbal\ negation],
  [`advmod:neg` has *zero occurrences* across all 26 Turkic treebanks. All
   independently maintained treebanks analyse the negator as `AUX` with `aux`
   or `cop`.],
  [#text(fill: ud_red, weight: "bold")[No]],
)

== Reading the result

#grid(columns: (1fr, 1fr), gutter: 24pt)[
  #block(fill: ud_red.lighten(94%), radius: 6pt, inset: 14pt, width: 100%)[
    *What it shows*

    #v(0.3em)
    The group's proposals have not been adopted beyond the treebanks maintained
    by its own members.
  ]
][
  #block(fill: ud_green.lighten(94%), radius: 6pt, inset: 14pt, width: 100%)[
    *What it does not show*

    #v(0.3em)
    That the analyses are wrong. Nothing here evaluates the proposals
    themselves.
  ]
]

#v(0.7em)

#takeaway[
  This is a *dissemination gap*. Publishing an analysis at a workshop does not
  put it into a treebank. Reaching maintainers directly, and working with the
  UD release cycle, has to become part of the method.
]

#v(0.45em)

#set text(size: 0.93em)
Expect *principled resistance* to some of the proposals, though — and uptake is
not the only measure. Alternative analyses appearing in print, or maintainers
joining the group rather than publishing against it, would each count as the
conversation working. A lesson that generalizes past Turkic and UniDive.

// ============================================================
= Prospects

== Where the work goes next

#grid(columns: (1fr, 1fr), gutter: 24pt)[
  *Resources*

  #v(0.25em)
  - Extend the parallel treebanks:
    - six languages in progress
    - Kazakh, Turkmen and Uyghur planned

  #v(0.7em)
  *New annotation challenges*

  #v(0.25em)
  - Quotative constructions
  - Multi-word expressions
  // NOTE(jonathan, 25 Aug): converbs and postpositional phrases were dropped —
  // he does not consider them genuine open problems. He suggests pulling two
  // more from the TurkLang Kyrgyz paper and from Bermet's recent non-MWE work;
  // neither of us can name those, so Bermet should fill them in here.
][
  *Adoption: the priority*

  #v(0.25em)
  - Propose changes *directly to treebank maintainers* rather than only
    publishing them.
  - Coordinate updates through the *UD release cycle*.
  - Keep the workshop and publication track running alongside.

  #v(0.7em)
  #block(fill: ud_gold.lighten(90%), radius: 5pt, inset: 11pt, width: 100%)[
    #set text(size: 0.88em)
    The group's structure outlives the Action: the *regular online meetings*,
    the subgroups and the shared agenda do not depend on UniDive funding to
    continue.
  ]
]

== Summary

#v(0.4em)

+ The UD Turkic Group has worked since *2023* to harmonize annotation across
  *26 treebanks*, covering *10 Turkic languages* and two code-switching corpora.

  #v(0.4em)
+ Four strands of output: pronominalized locatives, copula tokenization,
  non-verbal negation, and *sentence-aligned parallel treebanks* for four
  published languages.

  #v(0.4em)
+ Measuring our own impact showed *no uptake* in independently maintained
  treebanks — `advmod:neg` appears zero times across all 26.

  #v(0.4em)
+ The next phase is *adoption work*: maintainers and the release cycle, not
  only papers.

#v(0.6em)
#align(center)[
  #text(fill: ud_blue, weight: "bold", size: 1.50em)[Thank you, and questions?]

  #v(0.6em)

  #text(fill: ud_blue, weight: "bold", size: 1.50em)[
    #link("mailto:ud-turkic-group@googlegroups.com")[ud-turkic-group\@googlegroups.com]
  ]

  #v(0.8em)

  #scale(260%, reflow: true)[#qrcode("https://github.com/ud-turkic")]

  #v(0.4em)

  #text(fill: ud_blue, weight: "bold")[UD Turkic Group]
]


== Acknowledgements <touying:hidden>

#v(1em)

#align(center)[
  This work is supported by *COST Action CA21167* —\
  Universality, diversity and idiosyncrasy in language technology (UniDive).
]

#v(1.2em)

#align(center)[
  #grid(columns: 5, column-gutter: 30pt, align: horizon,
    image("images/logo-tuebingen.png", height: 2.2cm),
    image("images/logo-bogazici.png", height: 2.2cm),
    image("images/logo-elte.png", height: 2.2cm),
    image("images/logo-manas.png", height: 2.2cm),
    image("images/logo-swarthmore.png", height: 1.5cm),
  )
]

== References <touying:hidden>

#set text(size: 0.8em)

- Washington, J. et al. (2024). Strategies for the Annotation of Pronominalised
  Locatives in Turkic Universal Dependency Treebanks. _MWE-UD @ LREC-COLING
  2024_, Turin.

- Çöltekin, Ç. et al. (2026). Tokenisation of Turkic Copula Constructions in
  Universal Dependencies. _SIGTURK 2026 @ EACL_, Rabat.

- Mus, N. et al. (2026). Negation of Turkic Non-verbal Clauses: Analysis and
  Universal Dependencies Implementation. _UDW 2026_, Palma de Mallorca.

- Akhundjanova, A. et al. (2025). Parallel Universal Dependencies Treebanks for
  Turkic Languages. _UDW @ SyntaxFest 2025_, Ljubljana.

- Akkurt, F. et al. (2024). Unifying the Annotations in Turkic Universal
  Dependencies Treebanks. _2nd UniDive General Meeting_.

== Turkic UD Treebanks <sec:turkic-treebanks>

All Turkic treebanks in Universal Dependencies v2.18, with basic size,
genre, and domain statistics (@tab:treebank-stats).

#figure(
  scale(x: 90%, y: 90%, reflow: true)[
    #text(size: 8.5pt)[
      #table(
        columns: 5,
        align: (left, right, right, left, left),
        stroke: none,
        inset: (x: 6pt, y: 1.6pt),
        table.hline(stroke: 1pt),
        table.header(
          [*Treebank*], [*Sentences*], [*Words*], [*Genre*], [*Additional Information*],
        ),
        table.hline(stroke: 0.5pt),
        [Azerbaijani-TueCL], [148], [912], [grammar], [Parallel; grammar examples],
        [Kazakh-KTB], [1078], [10536], [news, fiction, wiki], [Mixed sources],
        [Kyrgyz-KTMU], [2530], [24128], [news, fiction], [Media texts],
        [Kyrgyz-TueCL], [173], [1250], [grammar], [Parallel; grammar examples],
        [Tatar-NMCTT], [148], [2280], [news, non-fiction], [Mixed sources],
        [Turkish-Atis], [5284], [44296], [news, non-fiction], [ATIS domain],
        [Turkish-BOUN], [9761], [125212], [news, non-fiction], [Web sources],
        [Turkish-FrameNet], [2698], [19223], [grammar], [FrameNet annotations],
        [Turkish-GB], [2880], [17177], [grammar], [Grammar examples],
        [Turkish-IMST], [5635], [58096], [news, non-fiction], [METU-Sabancı corpus],
        [Turkish-Kenet], [18687], [178658], [grammar], [Corpus of example sentences],
        [Turkish-Penn], [16395], [183612], [news, non-fiction], [Turkish Penn Treebank],
        [Turkish-PUD], [1000], [16881], [news, wiki], [Parallel corpus],
        [Turkish-Tourism], [19830], [91152], [reviews], [Hotel reviews],
        [Turkish-TueCL], [148], [904], [grammar], [Parallel source; Cairo, UDTW23],
        [Turkish-German-SAGT], [2184], [37227], [spoken], [Code-switching corpus],
        [Turkish-English-BUTR], [58], [441], [spoken], [Code-switching corpus],
        [Old Turkish-Clausal], [20], [158], [non-fiction], [Old Turkic script (Orkhon)],
        [Ottoman Turkish-BOUN], [514], [8851], [fiction, non-fiction], [Historical texts],
        [Ottoman Turkish-DUDU], [2246], [22027], [mixed genres], [Bible, fiction, non-fiction, government, news],
        [Ottoman Turkish-TueCL], [148], [929], [grammar], [Parallel; grammar examples],
        [Uyghur-UDT], [3456], [40236], [fiction], [Literary texts],
        [Uzbek-UzUDT], [684], [7582], [news, fiction], [Mixed sources],
        [Uzbek-TueCL], [148], [939], [grammar], [Parallel; Cairo, UDTW23],
        [Uzbek-UT], [500], [5930], [news, fiction], [Mixed sources],
        [Yakut-YKTDT], [299], [1460], [news, non-fiction], [Media texts],
        table.hline(stroke: 1pt),
      )
    ]
  ],
  caption: [Basic statistics on all Turkic UD treebanks available in version
    2.18. Counts are syntactic *words*, not surface tokens; the two differ
    wherever multi-word tokens are used.],
) <tab:treebank-stats>

