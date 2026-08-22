#import "vendor/unidep/lib.typ": dependency-tree

#set page(
  paper: "a0",
  flipped: false,
  margin: 1.4cm,
  fill: rgb("#F7F8FA"),
  background: {
    let stroke_style = (paint: rgb("#E7EAF0"), thickness: 0.8pt)
    let grid_size = 5cm

    for x in range(0, 17) {
      place(line(start: (x * grid_size, 0pt), end: (x * grid_size, 100%), stroke: stroke_style))
    }
    for y in range(0, 24) {
      place(line(start: (0pt, y * grid_size), end: (100%, y * grid_size), stroke: stroke_style))
    }
  },
)

#set text(
  font: "Fira Sans",
  size: 32pt,
  fill: rgb("#252A31"),
)

#let ud_blue = rgb("#1F5F99")
#let ud_teal = rgb("#168477")
#let ud_gold = rgb("#C78A13")
#let ud_red = rgb("#B64545")
#let ink = rgb("#252A31")
#let muted = rgb("#59616D")
#let line_color = rgb("#D9DEE8")
#let gap_s = 0.18cm
#let gap_m = 0.32cm
#let gap_l = 0.48cm

#let poster_block(title, body, accent: ud_blue) = {
  block(
    width: 100%,
    fill: white,
    radius: 9pt,
    inset: 0pt,
    stroke: (paint: line_color, thickness: 1pt),
    breakable: false,
    spacing: gap_l,
    [
      #block(
        width: 100%,
        fill: accent,
        inset: 17pt,
        radius: (top: 9pt),
        [#text(fill: white, size: 33pt, weight: "bold", title)]
      )
      #block(width: 100%, inset: 22pt, body)
    ],
  )
}

#let note_block(title, body, accent: ud_teal, fill: rgb("#F0F8F7")) = {
  block(
    width: 100%,
    fill: fill,
    stroke: (left: 5pt + accent),
    inset: 15pt,
    radius: 6pt,
    [
      #text(fill: accent, weight: "bold", size: 28pt)[#title]
      #v(gap_s)
      #body
    ],
  )
}

#let tag(value, color: ud_blue) = box(
  fill: color.lighten(85%),
  stroke: (paint: color, thickness: 1pt),
  radius: 4pt,
  inset: (x: 8pt, y: 4pt),
  text(fill: color.darken(20%), size: 24pt, weight: "bold", value),
)

#let mini_table(..rows) = table(
  columns: (1.1fr, 1.25fr, 1.35fr),
  inset: 9pt,
  stroke: (paint: rgb("#E3E7EF"), thickness: 0.6pt),
  align: (left, left, left),
  table.header([*Language*], [*Affirmative*], [*Negative*]),
  ..rows,
)

#let diagbox(body1, width: auto, height: auto, inset: 5pt) = {
  table.cell(inset: 0pt, box(
    width: 18cm,
    height: 1.3cm,
    stroke: none,
    [
      #text(body1)
      #place(line(start: (0%,0%), end: (100%,100%), stroke: 3pt + ud_red), dy: -34pt)
      #place(line(start: (0%,100%), end: (100%,0%), stroke: 3pt + ud_red), dy:-34pt)
    ]
  ))
}

#let affiliation_logos = [
  #grid(
    columns: (auto, auto, auto, auto, auto),
    gutter: 0.72cm,
    [#align(center + horizon)[#image("images/logo-elte.png", height: 2.75cm)]],
    [#align(center + horizon)[#image("images/logo-bogazici.png", height: 2.95cm)]],
    [#align(center + horizon)[#image("images/logo-tuebingen.png", height: 1.95cm)]],
    [#align(center + horizon)[#image("images/logo-swarthmore.webp", height: 2.15cm)]],
    [#align(center + horizon)[#image("images/logo-manas.png", height: 2.95cm)]],
  )
]

#let affiliations = [
  ELTE Research Centre for Linguistics \\
  Boğaziçi University \\
  University of Tübingen \\
  Swarthmore College \\
  Independent Researcher \\
  Kyrgyz-Turkish Manas University
]

// Header
#block(
  width: 100%,
    fill: white,
    inset: 1.6cm,
    radius: 10pt,
    stroke: (paint: line_color, thickness: 1pt),
    [
      #grid(
        columns: (1fr,),
        gutter: 0pt,
        align(left + horizon)[
          #text(
            size: 52pt,
            weight: "bold",
            fill: ud_blue,
            [Negation of Turkic non-verbal clauses: Analysis and Universal Dependencies Implementation],
          )
        ],
      )
    #v(0.65cm)
    #text(size: 34pt, weight: "semibold")[
      Nikolett Mus, Furkan Akkurt, Bermet Chontaeva, Soudabeh Eslami, Sardana Ivanova \
      Çağrı Çöltekin, Jonathan N. Washington, Gulnura Dzhumalieva and Aida Kasieva
    ]
    #v(0.28cm)
    #text(size: 23pt, fill: muted)[#affiliations]
    #v(0.34cm)
    #text(size: 27pt, fill: muted)[
      Ninth Workshop on Universal Dependencies (UDW 2026) #h(0.35cm)
      #text(fill: rgb("#9AA2AE"))[|] #h(0.35cm)
      16 May 2026, Palma de Mallorca
    ]
  ],
)

#v(gap_l)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.4cm,

  [
    #poster_block("Problem", accent: ud_blue)[
      Dedicated negators for non-verbal clauses.

      #v(gap_m)

      #mini_table(
        [Azerbaijani], [_Deniz döktürdür._], [_Deniz döktür dəyil._],
        [Kyrgyz], [_Deniz doktur._], [_Deniz doktur emes._],
        [Turkish], [_Deniz doktor._], [_Deniz doktor değil._],
        [], ['Deniz is a doctor.'], ['Deniz is not a doctor.']
      )

      #v(gap_m)

      + Azerbaijani: _değil_ / _dəyil_
      + Kyrgyz: _emes_
      + Turkish: _değil_

      #v(gap_s)

      Some Turkic UD analyses still label these as #tag("AUX") or #tag("COP").

      #v(gap_s)

      We argue for a different analysis.
    ]
    
      #v(gap_m)
      
    #poster_block("Diagnostic 1: Distributional behavior", accent: ud_teal)[
      Copula stays.

      #v(gap_m)

      #table(
        columns: (1fr, 1fr, 0.3fr),
        inset: 9pt,
        stroke: (paint: rgb("#E3E7EF"), thickness: 0.6pt),
        align: (left, left, left),
        table.header([*Affirmative*], [*Negative*], [*Lang.*]),
        [_Ben doktor i-di-m._], [_Ben doktor değil i-di-m._], [(Turkish)],
        [I doctor COP-PST-1SG], [I doctor NEG COP-PST-1SG], [],
        ['I was a doctor.'], ['I was not a doctor.'], [],
      )

      #v(gap_m)

      + affirmative needs copula
      + negative clause keeps it

      #v(gap_s)

      Separate negator, not copular head.
    ]

          #v(gap_m)
          
    #poster_block("Diagnostic 2: Subject agreement pattern", accent: ud_teal)[
      Agreement follows the host.
      
      #v(gap_m)

      #table(
        columns: (0.5fr, 1.2fr, 1.2fr),
        inset: 9pt,
        stroke: (paint: rgb("#E3E7EF"), thickness: 0.6pt),
        align: (left, left, left),
        table.header([*Language*], [*Construction*], [*Agreement locus*]),
        [Turkish], [_Ben doktor değil-im_], [negative element],
        [], [_Ben doktor değil i-di-m_], [copula],
        [Kyrgyz], [_Men doktur-mun_], [predicate nominal],
        [], [_Men doktur emes-min_], [negative element],
      )

      #v(gap_m)

      + no overt copula: agreement on the negator
      + overt copula: agreement on the copula

      #v(gap_s)

      Same agreement set as nominal, adjectival, and adverbial predicates.
]

          #v(gap_m)
          
    #poster_block("Diagnostic 3: Syntactic position and scope behavior", accent: ud_teal)[
      Negation tracks adjacency and scope.
      
      + Turkish / Azerbaijani: predicate + negator + copula
      //+ Kyrgyz: negator shifts with scope
      + Kyrgyz: negator can negate non-copulas

      #v(gap_m)

      - negation of copulas (predicate + negator + copula):
      #table(
        columns: (1fr, 1fr, 0.3fr),
        inset: 9pt,
        stroke: (paint: rgb("#E3E7EF"), thickness: 0.6pt),
        align: (left, left, left),
        table.header([*Example*], [*Gloss*], [*Lang.*]),
        [_Men jakşı doktur *emes* elem._], [‘I was not a good doctor.’], [(Kyrgyz)],
        [_Ben iyi bir doktor *değil* idim._], [‘I was not a good doctor.’], [(Turkish)],
        //[_Ben iyi bir doktor değil idim._], [NEG before copula], [(Turkish)],
        // [_Men jakşı emes doktur elem._], [NEG before predicate], [(Kyrgyz)],
        //[_Men jakşı doktur emes elem._], [NEG after predicate], [(Kyrgyz)],
        // [I was a doctor, but not a good one.], [scope contrast], [],
      )
      - negation of non-copulas (e.g., ADJ + negator):
      #table(
        columns: (1fr, 1fr, 0.3fr),
        inset: 9pt,
        stroke: (paint: rgb("#E3E7EF"), thickness: 0.6pt),
        align: (left, left, left),
        table.header([*Example*], [*Gloss*], [*Lang.*]),
        [_Men jakşı *emes* doktur elem._], [‘I was a not-good doctor.’], [(Kyrgyz)],
      )
    
    ]
  ],

  [
    #poster_block("Proposal", accent: ud_blue)[
      We treat the non-verbal negator as a phrasal modifier, with scope tracked by adjacency.

      In UD terms:

      #v(gap_m)

      #align(center)[
        #tag("UPOS = ADV", color: ud_blue)
        #h(0.7cm)
        with 
        #tag("DEPREL = advmod:neg", color: ud_blue)
      ]

      #v(gap_m)

      Captures scope, adjacency, and copula interaction.

      #v(gap_m)
    ]
      
    #poster_block("UD Analyses", accent: ud_gold)[
      #block(
        width: 100%,
        fill: rgb("#FAFBFD"),
        stroke: (paint: rgb("#DDE3EC"), thickness: 0.8pt),
        radius: 6pt,
        inset: 16pt,
        [
          #text(size: 29pt, weight: "bold", fill: ud_blue)[No overt copula]
          #v(0.28cm)
          #let turkish_no_copula = ```
# text = Deniz doktor değil.
1	Deniz	Deniz	PROPN	_	_	2	nsubj	_	_
2	doktor	doktor	NOUN	_	_	0	root	_	_
3	değil	değil	ADV	_	_	2	advmod:neg	_	_
4	.	.	PUNCT	_	_	2	punct	_	_
```.text
          #align(center)[
            #block[
              #set text(size: 26pt)
              #dependency-tree(
                turkish_no_copula,
                show-text: true,
                show-upos: true,
                word-spacing: 7.2,
                level-height: 2.6,
                arc-roundness: 0.26,
                tail-spacing: 0.4,
                head-spacing: 0.16,
              )
            ]
          ]
        ],
      )

      #v(0.9cm)

      #block(
        width: 100%,
        fill: rgb("#FAFBFD"),
        stroke: (paint: rgb("#DDE3EC"), thickness: 0.8pt),
        radius: 6pt,
        inset: 16pt,
        [
          #text(size: 29pt, weight: "bold", fill: ud_blue)[With overt copula]
          #v(0.28cm)
          #let turkish_with_copula = ```
# text = Ben doktor değilim.
1	Ben	ben	PRON	_	_	2	nsubj	_	_
2	doktor	doktor	NOUN	_	_	0	root	_	_
3	değil	değil	ADV	_	_	2	advmod:neg	_	_
4	im	i	AUX	_	_	2	cop	_	_
5	.	.	PUNCT	_	_	2	punct	_	_
```.text
          #align(center)[
            #block[
              #set text(size: 26pt)
              #dependency-tree(
                turkish_with_copula,
                show-text: true,
                show-upos: true,
                word-spacing: 7.2,
                level-height: 2.6,
                arc-roundness: 0.26,
                tail-spacing: 0.4,
                head-spacing: 0.16,
              )
            ]
          ]
        ],
      )
    ]
    

    #poster_block("Cross-linguistic Payoff", accent: ud_gold)[
      One treatment across the Turkic treebanks:

      #v(gap_m)

      + separates negators from copulas and auxiliaries
      + keeps Oghuz and Kypchak annotations comparable
      + preserves Kyrgyz scope contrasts
      + fits copula tokenisation, e.g. _değildim_

      #v(gap_m)

      #note_block("Tokenisation interaction", [
        Split bound copula/agreement morphology into a separate token.
      ], accent: ud_gold, fill: rgb("#FFF8E8"))
    ]

    #poster_block("Takeaway", accent: ud_red)[
      Non-verbal negators behave like phrasal modifiers rather than copular heads or auxiliaries.

      #v(gap_m)

      #align(center)[
        #diagbox[#tag(text(size: 42pt, weight: "bold", fill: ud_red)[`UPOS = AUX`], color: ud_red), #tag(text(size: 42pt, weight: "bold", fill: ud_red)[`DEPREL = cop`], color: ud_red)]
        #v(0.15cm)
        #tag(text(size: 42pt, weight: "bold", fill: ud_teal)[`UPOS = ADV`], color: ud_teal), #tag(text(size: 42pt, weight: "bold", fill: ud_blue)[`DEPREL = advmod:neg`], color: ud_blue)
      ]

      #v(gap_m)

      This analysis aligns form, scope, and agreement.
    ]
  ],
)

#place(bottom + center)[
  #block(
    width: 100%,
    outset: 1.4cm,
    fill: white,
    stroke: (top: 2pt + ud_blue),
    inset: 1.2cm,
    [
      #grid(
        columns: (1fr, auto),
        gutter: 1cm,
        align(left + horizon)[
          #affiliation_logos
        ],
        align(right + horizon)[
          #block(
            fill: rgb("#F8FAFC"),
            inset: 18pt,
            radius: 7pt,
            stroke: (paint: line_color, thickness: 1pt),
            align(right)[
              #text(size: 25pt, style: "italic", fill: ink)[Negation of Turkic non-verbal clauses] \
              #v(0.08cm)
              #text(size: 22pt, fill: muted)[Mus, Akkurt, Chontaeva, Eslami, Ivanova, Çöltekin, Washington, Dzhumalieva and Kasieva]
            ],
          )
        ],
      )
    ],
  )
]
