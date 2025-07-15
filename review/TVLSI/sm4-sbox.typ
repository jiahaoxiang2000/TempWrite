#import "@preview/basic-document-props:0.1.0": simple-page

// Chinese font configuration
// #set text(
//   font: (
//     "Noto Sans CJK SC", // Primary Chinese font
//     "Noto Serif CJK SC", // Alternative Chinese serif font
//     "Noto Sans", // Latin fallback
//   ),
//   lang: "zh",
//   region: "cn",
// )

// Document setup
#set document(title: "Academic Paper Review", author: "isomo", date: datetime.today())

// Page setup
#set page(
  numbering: "1",
  number-align: center,
)

// Heading styles
#show heading.where(level: 1): set text(size: 16pt, weight: "bold")
#show heading.where(level: 2): set text(size: 14pt, weight: "bold")
#show heading.where(level: 3): set text(size: 12pt, weight: "bold")

// Citation styling - make citations blue and clickable-looking
#show cite: set text(fill: blue)

// Table caption positioning - put captions above tables
#show figure.where(kind: table): it => [
  #it.caption
  #it.body
]

// Color shorthand functions
#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)
#let yellowt(content) = text(fill: yellow, content)
#let oranget(content) = text(fill: orange, content)
#let purplet(content) = text(fill: purple, content)
#let greyt(content) = text(fill: gray, content)
#let grayt(content) = text(fill: gray, content)

// Review scoring function
#let score-box(title, score, max-score: 10) = rect(width: 100%, stroke: 1pt, inset: 8pt, fill: luma(250), [
  #text(weight: "bold")[#title: ] #text(fill: blue, weight: "bold")[#score/#max-score]
])

// Comment box function
#let comment-box(title, content) = rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold", size: 11pt)[#title]
  #v(0.5em)
  #content
])

// Title page
#align(center)[
  #text(size: 18pt, weight: "bold")[
    Academic Paper Review Report
  ]
  #v(0.5em)
  #text(size: 12pt)[
    Review Date: #datetime.today().display("[year]-[month]-[day]")
  ]
]

#v(1em)

// Paper information section
#rect(width: 100%, stroke: 1pt, inset: 10pt, fill: luma(245), [
  #text(weight: "bold", size: 14pt)[Paper Information]

  #grid(
    columns: (auto, 1fr),
    gutter: 1em,
    [*Paper Title:*],
    [High-Performance SM4 S-Box Design Based on Linear Matrix Extension and Nonlinear Modules Series-Connection],

    [*Manuscript ID:*], [TVLSI-00540-2025],
    [*Journal/Conference:*], [IEEE Transactions on Very Large Scale Integration Systems],
  )
])

#v(1em)


= Review Summary


= Detailed Review

The main innovations of this paper include:

- This paper focuses on optimizing the hardware design of the S-box in the commercial cipher algorithm SM4.
- It proposes a novel method based on linear matrix extension and nonlinear module series-connection to enhance S-box structure performance. Compared to traditional S-box implementations, this method achieves an optimal depth reduction to 19.

== Innovation Assessment
The paper presents three main technical contributions, but their novelty and significance are questionable:


*K-step bundle update strategy:* The combination of exhaustive and heuristic algorithms with depth constraints is a practical engineering optimization but lacks theoretical depth. The authors fail to provide rigorous complexity analysis or prove optimality bounds for their hybrid approach.
The adaptive switching between algorithms appears ad-hoc without principled decision criteria.

*Scope limitations:* The work is narrowly focused on SM4 S-box implementation, limiting its broader impact. No analysis is provided for applicability to other cipher S-boxes or general circuit optimization scenarios.


== Technical Quality Assessment

*Insufficient complexity analysis:* The authors claim their approach "achieves optimization with the fewest circuit elements" but provide no formal proof or complexity bounds. The comparison of area vs. depth trade-offs lacks theoretical grounding.

*Incomplete algorithmic descriptions:* The k-step bundling algorithm and backtracking judgment mechanism lack sufficient detail for reproduction. Critical parameters and decision thresholds are not clearly specified.

*Missing security analysis:* For a cryptographic implementation, the paper lacks discussion of potential side-channel vulnerabilities or resistance to fault attacks, which are critical for practical deployment.


== Experimental Assessment

*Limited baseline comparisons:* The experimental evaluation suffers from several methodological issues:

*Selective benchmarking:* The authors primarily compare against older implementations (Canright 2005, Boyar & Peralta 2010) while omitting recent state-of-the-art works. This creates a misleading impression of performance advantages.

== Writing Quality Assessment
Fig. 8–9: Axis labels unclear; "Type 1/2" matrices undefined.Fig. 10: Y-axis unlabeled; SMIC process data indistinct.Fig. 15–16: Use %-utilization (not raw values) for cross-platform fairness.
= Specific Revision Suggestions

== Major Issues

- the Paper title "S-Box Design" should be "S-Box Implementation" to better reflect the content.
- Lacks quantitative baselines (e.g., "15% area reduction vs. state-of-the-art") for the SM4 full cipher performance claims.


== Minor Issues

Language: Technically precise but minor errors exist (e.g., "achieves optimization with the fewest circuit elements" → "achieves minimal circuit elements").


= Review Comments

This paper proposes a tower field-based SM4 S-box design achieving 102 gates and 19-level depth. While technically sound, the work has significant limitations: incremental novelty over existing composite field methods, insufficient theoretical analysis of optimality claims, selective benchmarking against outdated baselines, and poor figure quality with unclear labeling.
The detail comments are as follows:

1. *Innovation Assessment*: Asymmetric transformation matrix extension is incremental over existing composite field methods. K-step bundling lacks theoretical complexity analysis and optimality bounds.

2. *Technical Quality*: Claims of "optimal depth 19" not rigorously validated against theoretical lower bounds. Missing formal verification of matrix transformations.

3. *Experimental Methodology*: Selective benchmarking against outdated implementations (Canright 2005, Boyar & Peralta 2010). Missing recent state-of-the-art comparisons.

4. *Figure Quality*: Fig. 8-9 have unclear axis labels and undefined "Type 1/2" matrices. Fig. 10 lacks Y-axis labeling. Fig. 15-16 should use percentage utilization for fairness.

5. *Missing Security Analysis*: No discussion of side-channel vulnerabilities or fault attack resistance for cryptographic implementation.



#v(1em)

#align(right)[
  #text(size: 11pt)[
    Reviewer: isomo \
    Review Date: #datetime.today().display("[year]-[month]-[day]")
  ]
]

// Bibliography section
// #bibliography("../references.bib", style: "apa")
