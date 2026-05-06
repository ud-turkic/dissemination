#set page(
  paper: "a0",
  flipped: false,
  margin: 1.5cm,
  fill: rgb("#F6F7F9"),
  background: {
    let stroke_style = (paint: rgb("#E6E8EC"), thickness: 1pt)
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
  size: 29pt,
  fill: rgb("#2E2E2E"),
)

// EACL 2026 brand colors (from logo)
#let eacl_red = rgb("#C1272D")
#let eacl_green = rgb("#006233")
#let color_darkgrey = rgb("#333333")

// Spacing helpers
#let gap_s = 0.2cm
#let gap_m = 0.3cm
#let gap_l = 0.4cm

// Block styling — green header bars
#let poster_block(title, body) = {
  block(
    width: 100%,
    fill: white,
    radius: 10pt,
    inset: 0pt,
    stroke: (paint: rgb("#E6E8EC"), thickness: 1pt),
    breakable: false,
    spacing: gap_l,
    [
      #block(
        width: 100%,
        fill: eacl_green,
        inset: 18pt,
        radius: (top: 10pt),
        [*#text(fill: white, size: 31pt, weight: "bold", title)*],
      )
      #block(
        width: 100%,
        inset: 22pt,
        body,
      )
    ],
  )
}

// Inner highlight blocks — red accent
#let inner_block(title, body) = {
  block(
    width: 100%,
    fill: rgb("#FDF4F4"),
    stroke: (left: 5pt + eacl_red),
    inset: 16pt,
    radius: 6pt,
    [
      #text(fill: eacl_red, weight: "bold", size: 29pt)[#title]
      #v(gap_s)
      #body
    ],
  )
}

// Green inner block for the proposal
#let proposal_block(title, body) = {
  block(
    width: 100%,
    fill: rgb("#F0F7F2"),
    stroke: (left: 5pt + eacl_green),
    inset: 16pt,
    radius: 6pt,
    [
      #text(fill: eacl_green, weight: "bold", size: 29pt)[#title]
      #v(gap_s)
      #body
    ],
  )
}

// --- Header ---
#block(
  width: 100%,
  fill: white,
  inset: 1.8cm,
  radius: 10pt,
  stroke: (paint: rgb("#E6E8EC"), thickness: 1pt),
  [
    #grid(
      columns: (1fr, auto),
      gutter: 1.5cm,
      [
        #text(
          size: 62pt,
          weight: "bold",
          fill: eacl_red,
          "Tokenisation of Turkic Copula Constructions in Universal Dependencies",
        )
        #v(0.8cm)
        #text(size: 34pt, weight: "semibold")[
          Çağrı Çöltekin#super[1],
          Furkan Akkurt#super[2],
          Bermet Chontaeva#super[1],
          Soudabeh Eslami#super[1],
          Sardana Ivanova#super[3],
          Gulnur Dzhumalieva#super[4],
          Aida Kasieva#super[4],
          Nikolett Mus#super[5],
          Jonathan Washington#super[6]
        ]
        #v(0.3cm)
        #text(size: 28pt, fill: rgb("#555555"))[
          #super[1]U. of Tübingen
          #h(0.5cm) #super[2]Boğaziçi U.
          #h(0.5cm) #super[3]Independent Researcher
          #h(0.5cm) #super[4]Kyrgyz-Turkish Manas U.
          #h(0.5cm) #super[5]HUN-REN Hungarian Research Centre for Linguistics
          #h(0.5cm) #super[6]Swarthmore C.
        ]
      ],
      align(right + horizon)[
        #box(height: 4cm, image("images/eacl2026.png", fit: "contain"))
      ],
    )
  ],
)

#v(gap_l)

// --- Main Content ---
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,

  // ========== Column 1 ==========
  // Background: what copulas are, the data, and the problem
  [
    #poster_block("Motivation")[
      Defining _word_ boundaries is difficult for morphologically rich languages. We propose *guiding principles* for units of morphosyntactic analysis and apply them to *copular constructions in Turkic languages* in Universal Dependencies (UD).

      #v(gap_m)

      #inner_block("Lexical Integrity Principle (Haspelmath & Sims, 2010)")[
        _"Rules of syntax can refer/apply to entire words or the properties of entire words, but not to the internal parts of words or their properties."_
      ]
    ]

    #poster_block("Copular Constructions in Turkic Languages")[
      Three copula strategies are attested:
      + *Full (semi-)copula verb* (e.g., _ol-_ 'be')
      + *Defective copula verb ER* (e.g., Turkish _i-_), free or bound
      + *Agreement suffixes* (which may be null)

      #v(gap_m)

      #inner_block("Old Turkic vs. Modern Turkish")[
        *Old Turkic*: _Bän äbdä (är-ür) män._ — full verb _är_, stand-alone _män_ \
        *Modern Turkish*: _Ben evdeyim._ — no overt verb, _-yim_ suffixed to predicate
      ]
    ]

    #poster_block("The Problem: Conflicting Features")[
      When the copula is *bound*, the no-segmentation approach violates lexical integrity:

      #v(gap_m)

      #inner_block("Ben dağlardaydım 'I was in the mountains'")[
        _dağlardaydım_ (mountain-PL-LOC-COP-PST-1SG) carries:
        - Noun _dağ_: `Number=Plur | Person=3`
        - Copula _-ydım_: `Number=Sing | Person=1`

        *Conflicting features on a single word.*
      ]

      #v(gap_s)

      Compare: _Ben dağlarda idim._ (free copula) — no conflict.
    ]

    #poster_block("Defective Copula Verb ER")[
      Forms of the defective copula across Turkic languages — showing free and bound variants:

      #v(gap_s)

      #block(
        width: 100%,
        fill: rgb("#FAFAFA"),
        stroke: (paint: rgb("#E6E8EC"), thickness: 1pt),
        radius: 6pt,
        inset: 14pt,
        [
          #table(
            columns: (auto, auto, auto, auto, auto, auto, auto, auto),
            inset: 9pt,
            align: (left, center, center, center, center, center, center, center),
            stroke: none,
            table.header(
              table.cell(rowspan: 2)[*Language*],
              table.cell(colspan: 2)[*-DI*],
              table.cell(colspan: 2)[*-mIş*],
              table.cell(colspan: 2)[*-sA*],
              table.cell(rowspan: 2)[*VN*],
              [free], [bound], [free], [bound], [free], [bound],
            ),
            table.hline(),
            [Azerbaijani], [idi], [-(y)DI], [imiş], [-(y)mIş], [isə], [-(y)sA], [—],
            [Kazakh], [еді], [—], [—], [—], [—], [—], [екен(діг)і],
            [Kyrgyz], [эле], [—], [—], [—], [—], [—], [экен(диг)и],
            [Sakha], [этэ], [—], [эбит], [—], [—], [—], [—],
            [Tatar], [иде], [—], [—], [—], [—], [—], [икән(лег)е],
            [Turkish], [idi], [-(y)DI], [imiş], [-(y)mIş], [ise], [-(y)sA], [—],
            [Uzbek], [edi], [—], [—], [—], [isa], [—], [ekan(lig)i],
          )
        ],
      )
    ]

  ],

  // ========== Column 2 ==========
  [
    #poster_block("Proposed Solution")[
      We propose *tokenising bound copula affixes and agreement suffixes* as separate syntactic words using UD multi-word tokens.

      #v(gap_m)

      #proposal_block("Desirable Properties for Syntactic Words")[
        + No syntactic relation should refer to parts of a syntactic word
        + No repeated or conflicting morphological features
        + Compliant with UD framework principles
        + Close match with orthography
        + Similar analysis within and across related languages
        + No loss of information or bleaching of linguistic distinctions
      ]

      #v(gap_m)

      #inner_block("Segmented Analysis: dağlardaydım → dağlarda + ydım")[
        #table(
          columns: (auto, auto, auto, auto),
          inset: 9pt,
          stroke: none,
          align: (center, center, center, center),
          [*Ben*], [*dağlarda*], [*ydım*], [],
          [PRON], [NOUN], [AUX], [_lemma_],
          [Sing\|1], [Plur\|3], [Sing\|1], [i],
        )

        #v(gap_s)

        nsubj(dağlarda, Ben) #h(0.6cm) cop(dağlarda, ydım) #h(0.6cm) root(dağlarda)

        #v(gap_s)

        No conflicting features. Properties (i)–(ii) satisfied. Free/bound distinction marked through multi-word tokens (vi).
      ]

      #v(gap_s)

      *Present tense*: _Ben dağlardayım_ — no copula verb, but _-yım_ still segmented. 3sg has no overt marker (null elements not allowed in UD basic dependencies).
    ]

    #poster_block("Agreement Suffixes")[
      Predicate agreement paradigms across Turkic languages:

      #v(gap_s)

      #block(
        width: 100%,
        fill: rgb("#FAFAFA"),
        stroke: (paint: rgb("#E6E8EC"), thickness: 1pt),
        radius: 6pt,
        inset: 14pt,
        [
          #table(
            columns: (auto, auto, auto, auto, auto),
            inset: 9pt,
            align: (left, center, center, center, center),
            stroke: none,
            table.header(
              [*Language*], [*1sg*], [*2sg*], [*3sg*], [*1pl*],
            ),
            table.hline(),
            [Azerbaijani], [-(y)Am], [-(s)An], [(-DIr)], [-(y)IK],
            [Kazakh], [-MIn], [-sIŋ], [—], [-MIz],
            [Kyrgyz], [-mIn], [-sIŋ], [—], [-BIz],
            [Qaraqalpaq], [-MAn], [-sAŋ], [—], [-MIz],
            [Sakha], [-BIn], [-GIn], [—], [-BIt],
            [Tatar], [-mIn], [-sIŋ], [—], [-BIz],
            [Turkish], [-(y)Im], [-sIn], [—], [-(y)Iz],
            [Tuvan], [men], [sen], [—], [bis],
            [Uzbek], [-man], [-san], [(-DIr)], [-miz],
          )
        ],
      )
    ]

    #poster_block("Conclusions & Future Work")[
      We propose *separate tokenisation* of bound copula agreement affixes and bound forms of the copula verb ER — resolving conflicting features while preserving linguistic distinctions.

      #v(gap_s)

      *Open issues*: copular negation, copular forms with non-finite verbs, the _-DIr_ morpheme, full copula verb BOL, interaction with question particle tokenisation.
    ]
  ],
)

// --- Full-width block ---
#poster_block("Current Practice in Turkic UD Treebanks")[
  A survey of 13 Turkic UD treebanks (v2.17) reveals two main strategies. Our proposal provides principled guidelines aligning with the subtokenisation strategy.

  #v(gap_m)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5cm,
    proposal_block("Tokenise as subtokens")[
      Bound copula/agreement split into separate syntactic words. \
      Turkish-BOUN, -GB, -PUD, -TueCL, Azerbaijani-TueCL, Kazakh-KTB
    ],
    inner_block("Not tokenised")[
      Copula features on the predicate token. No subtokenisation. \
      Kyrgyz-KTMU, Tatar-NMCTT, Turkish-Kenet, -Penn, Uzbek-UDT, -UT, Yakut-YKTDT
    ],
  )
]


// --- Footer ---
#place(bottom + center)[
  #block(
    width: 100%,
    outset: 1.5cm,
    fill: white,
    stroke: (top: 2pt + eacl_green),
    inset: 1.5cm,
    [
      #grid(
        columns: (1fr, auto),
        gutter: 1cm,
        align(left + horizon)[
          #text(size: 33pt, fill: eacl_red, weight: "bold")[SIGTURK 2026 at EACL 2026] \
          #v(0.15cm)
          #text(size: 28pt, fill: color_darkgrey)[
            Mars #text(fill: rgb("#999999"))[\u{00B7}]
            March 28, 2026 #text(fill: rgb("#999999"))[\u{00B7}]
            مارس
          ] \
          #text(size: 28pt, fill: color_darkgrey)[
            Rabat #text(fill: rgb("#999999"))[\u{00B7}]
            الرباط #text(fill: rgb("#999999"))[\u{00B7}]
            #text(fill: eacl_green)[Morocco]
          ]
        ],
        align(right + horizon)[
          #block(
            fill: rgb("#F9F9F9"),
            inset: 20pt,
            radius: 8pt,
            stroke: (paint: eacl_green, thickness: 1pt),
            align(right)[
              #text(
                size: 28pt,
                style: "italic",
                fill: eacl_red,
              )[Tokenisation of Turkic Copula Constructions in UD] \
              #v(0.1cm)
              #text(
                size: 24pt,
                fill: rgb("#666666"),
              )[Çöltekin, Akkurt, Chontaeva, Eslami, Ivanova, Dzhumalieva, Kasieva, Mus, Washington]
            ],
          )
        ],
      )
    ],
  )
]
