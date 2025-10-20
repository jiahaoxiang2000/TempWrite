#import "@preview/theorion:0.3.2": *

// Document configuration
#let title = "Think Notes"
#let author = "isomo"
#let date = datetime.today()

// Custom color scheme inspired by elegant academic style
#let primary-color = rgb("#20B2AA")  // Light sea green
#let secondary-color = rgb("#4682B4") // Steel blue
#let accent-color = rgb("#DC143C")    // Crimson
#let text-color = rgb("#2F4F4F")      // Dark slate gray

// Page setup with academic styling
#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 3cm, bottom: 3cm),
  numbering: "1",
  number-align: center,
  header: context {
    if counter(page).get().first() > 1 {
      align(center, line(length: 100%, stroke: 0.5pt + gray))
      v(-0.75em)
      align(center, text(size: 10pt, fill: gray, title))
    }
  },
)

// Typography setup
#set text(
  font: ("New Computer Modern", "Source Han Serif"),
  size: 11pt,
  fill: text-color,
  lang: "en",
  fallback: true,
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 1.2em,
)

// Heading numbering
#set heading(numbering: "1.1")

// Heading styles
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(2em)
  block[
    #set align(center)
    #set text(size: 20pt, weight: "bold", fill: primary-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(0.5em)
    ]
    #upper(it.body)
    #v(1em)
    #line(length: 60%, stroke: 2pt + primary-color)
  ]
  v(1.5em)
}

#show heading.where(level: 2): it => {
  v(1.5em)
  block[
    #set text(size: 16pt, weight: "bold", fill: secondary-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(0.5em)
    ]
    #it.body
    #v(0.5em)
    #line(length: 100%, stroke: 1pt + secondary-color)
  ]
  v(1em)
}

#show heading.where(level: 3): it => {
  v(1em)
  block[
    #set text(size: 14pt, weight: "bold", fill: text-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(0.5em)
    ]
    #it.body
  ]
  v(0.75em)
}

// Configure theorem environments with theorion
#show: show-theorion

// Math equation numbering
#set math.equation(numbering: "(1)")

// Bibliography setup (if references.bib exists)
#let bibliography-file = "references.bib"

// Custom functions for colored text shortcuts
#let redt(content) = text(fill: rgb("#DC143C"), content)
#let bluet(content) = text(fill: rgb("#1E90FF"), content)
#let greent(content) = text(fill: rgb("#32CD32"), content)

// Title page
#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold", fill: primary-color)[
    #upper(title)
  ]
  #v(1cm)
  #text(size: 14pt, fill: secondary-color)[
    日常随想
  ]
  #v(2cm)
  #text(size: 12pt)[
    *Author:* #author \
    *Date:* #date.display("[month repr:long] [day], [year]")
  ]
  #v(1cm)
  #line(length: 50%, stroke: 1pt + primary-color)
]

#pagebreak()

// Table of contents
#outline(
  title: [Table of Contents],
  indent: auto,
)

#pagebreak()

// Preface
= 前言

从很久开始以前，就是有写日记的习惯，口语化，碎片化。
但是随着记录的东西，或者不同时间的💡不一致，所以想用更正式的方式去记录，所以有了这个随记。
我们看了👀很多过往时间写的东西，很多事情是随机的，独立的。
但是中间却是在讨论*同一个主题*，只是在不同时间，不同场景下，用不同的方式去描述。
所以，我想把这些碎片化的想法，整理成一个更*系统化*的记录，回看的时候更像连续剧，而不是碎片化的短视频。

+ 关于*组织的形式*，首先按照事件所属主题来分类，对应到不同的章节，最低层的标题对应其所属的的时间。这样，我们可以按照主题来查看，也可以按照时间线来查看。
+ 对于*内容*来说，可以是英文也可以中文，这个得益于新的_typst_的排版引擎，可以很好的处理中英文混排。还可以有emoji👿，真的是很爽。还可以有文章引用 @ctex2020manual  



// Bibliography (uncomment if references.bib exists)
#bibliography(bibliography-file, style: "ieee")
