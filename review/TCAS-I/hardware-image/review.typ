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

// Document configuration
#let document-author = "isomo"

// Document setup
#set document(
  title: "Hardware Encryption Application for IoMT Systems Based on Homogeneous Multistability and Adaptive Quantum Orbit-hopping Key Update Mechanism",
  author: document-author,
  date: datetime.today(),
)

// Page setup
#set page(
  numbering: "1",
  number-align: center,
)

// Heading styles with numbering
#set heading(numbering: "1.1.1.")
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
    Reviewer: #document-author
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
    [Efficient MPC Implementation of the CRAFT Block Cipher Using Arithmetic Circuits for IoT Systems],

    [*Manuscript ID:*], [TCAS-I-00108-2026],
    [*Journal/Conference:*], [IEEE Transactions on Circuits and Systems I: Regular Papers],
  )
])

#v(1em)

= Review Summary

#lorem(10)

= Detailed Review

== Innovation Assessment

#lorem(10)


== Technical Quality Assessment

#lorem(10)


== Experimental Assessment

#lorem(10)


== Writing Quality Assessment

#lorem(10)

= Specific Revision Suggestions

== Issues

= Review Comments

#lorem(10)



