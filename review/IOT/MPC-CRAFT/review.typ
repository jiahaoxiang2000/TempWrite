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
  title: "Efficient MPC Implementation of the CRAFT Block Cipher
Using Arithmetic Circuits for IoT Systems",
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

    [*Manuscript ID:*], [IoT-60751-2026],
    [*Journal/Conference:*], [IEEE Internet of Things Journal],
  )
])

#v(1em)

= Quick read Paper Information

== Paper Overview

This paper investigates the secure multi-party computation (MPC) evaluation of the CRAFT block cipher using arithmetic circuits, specifically targeting IoT systems. CRAFT is a lightweight tweakable block cipher (64-bit block, 128-bit key, 64-bit tweak) designed by Beierle et al. at ToSC 2019, originally intended to provide resistance against differential fault analysis attacks.

The core motivation stems from the need for interoperability between traditional symmetric-key primitives and MPC frameworks in IoT applications, where sensitive data are jointly processed by mutually untrusted parties (e.g., threshold key management, privacy-preserving data aggregation, collaborative edge analytics).

*Authors:* Yingjie Zhang (Beijing Institute of Mathematical Sciences and Applications), Lijun Lyu (Chongqing University of Technology, Corresponding Author), Dongyu Wu (BIMSA), Zijun Zhuang (Tsinghua University), Gang Liu (National Key Laboratory of Security Communication, Corresponding Author)

== Key Technical Contributions

+ *Arithmetic Circuit Representation:* Investigates MPC evaluation of CRAFT using arithmetic circuits by leveraging its nibble-oriented structure (each nibble represented as an element in $FF_(2^4)$).

+ *S-box Optimization:* Derives the interpolation polynomial of CRAFT's S-box over $FF_(2^4) = FF_2[X]/(X^4 + X + 1)$ and applies the CRV decomposition technique to reduce multiplication operations from 4 (boolean) to 2 (arithmetic).

+ *Complete Implementation:* Provides full MPC implementation using the MASCOT protocol within the MP-SPDZ framework with active security against dishonest majority.

+ *Comparative Evaluation:* Demonstrates that arithmetic circuits reduce multiplication triples by 50% (992 vs 1984) while maintaining the same circuit depth (124).

+ *Scalability Analysis:* Evaluates amortization benefits when processing multiple blocks, showing significant efficiency improvements in multi-party settings.

== Technical Approach

*Circuit Representation Strategy:*
- Uses nibble-oriented design of CRAFT for natural arithmetic circuit representation
- Finite field: $FF_(2^4) = FF_2[X]/(X^4 + X + 1)$ (chosen to minimize nonzeros in S-box interpolating polynomial)
- Embedding into $FF_(2^(40))$ for MP-SPDZ compatibility (40-bit security against cheating)

*S-box Decomposition:*
- Interpolation polynomial $P_4(z)$ with 14 nonzero terms
- CRV decomposition: $P_4(z) = G_1(z) dot H_1(z) + G_2(z)$
- Cyclotomic bases: ${0, 1, 3}$ generating exponent set $L = {0, 1, 2, 3, 4, 6, 8, 9, 12}$
- Result: 2 multiplications + 8 random bits per S-box (vs 4 AND gates in boolean)

*Protocol:*
- MASCOT protocol: SPDZ-style dishonest majority protocol using OT extensions
- Additive secret sharing with MAC-based authentication ($m = x dot Delta$)
- Offline phase: Generate multiplication triples and random bits
- Online phase: Beaver triple-based multiplication

== Performance Highlights

*Single-Block (3-party setting):*
#table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  inset: 6pt,
  align: center,
  [*Circuit*], [*Offline Time*], [*Offline Data*], [*Online Time*], [*Online Data*], [*Total Time*], [*Total Data*],
  [Boolean], [76.371 ms], [22.617 MB], [15.282 ms], [0.426 MB], [95.629 ms], [22.659 MB],
  [Arithmetic], [45.187 ms], [11.482 MB], [14.993 ms], [0.032 MB], [62.799 ms], [11.514 MB],
)

*Key Improvements:*
- ~51% reduction in communication data
- 65.67% of runtime compared to boolean circuits
- Online data reduced by 92% (0.426 MB -> 0.032 MB)

*Amortized Performance (100 blocks, 10-party):*
- Amortized cost reduced to 64.71% of single-block cost
- Communication scales linearly with parties (~5.7 MB per party per block)

= Review Summary

#score-box("Overall Recommendation", "5", max-score: 10)

*Verdict:* Major Revision

This paper presents a solid contribution to the MPC implementation of lightweight block ciphers for IoT systems. The work successfully demonstrates that arithmetic circuit representations can significantly outperform boolean circuit implementations for CRAFT in MPC settings. The technical approach is sound, the implementation is complete, and the experimental evaluation is thorough.

*Strengths:*
- Clear motivation connecting IoT security requirements with MPC efficiency
- Novel application of CRV decomposition to CRAFT's S-box
- Comprehensive implementation using the well-established MP-SPDZ framework
- Thorough experimental comparison with boolean circuit baseline
- Practical relevance to threshold cryptography and distributed key management

*Weaknesses:*
- Limited novelty in core techniques (CRV decomposition is known, MASCOT is existing)
- Comparison limited to single cipher (no cross-cipher analysis)
- Security analysis relies entirely on MASCOT's existing guarantees
- Missing analysis of memory consumption and preprocessing storage

= Detailed Review

== Innovation Assessment

#score-box("Innovation Score", "6", max-score: 10)

The paper's innovation lies primarily in the *application* rather than the *development* of new techniques.

*Positive aspects:*
- First systematic study of CRAFT's arithmetic circuit representation for MPC
- Careful selection of irreducible polynomial to minimize S-box interpolation terms
- Complete embedding strategy from $FF_(2^4)$ to $FF_(2^(40))$ with optimized bit matrix

*Limitations:*
- CRV decomposition technique is from prior work (Jean-Sébastien et al.)
- The MASCOT protocol and MP-SPDZ framework are existing tools
- The approach follows the methodology established by Abidin et al. (ESORICS 2023) for other ciphers

The contribution is more "systematic engineering" than "fundamental innovation," which is acceptable for IEEE IoT Journal but limits the novelty claim.


== Technical Quality Assessment

#score-box("Technical Quality Score", "8", max-score: 10)

The technical execution is generally strong with appropriate mathematical rigor.

*Strengths:*
- Correct derivation of S-box interpolation polynomial
- Proper application of CRV decomposition with verified parameters ($t=2$, $zeta = {0,1,3}$)
- Sound embedding algorithm (Algorithm 2) with complexity optimization
- Accurate gate count analysis (Table V)

*Minor concerns:*
- Algorithm 2 (finding lowest-cost embedding) lacks complexity analysis
- The paper assumes readers understand SPDZ-style protocols but provides only superficial coverage
- Missing formal security reduction (relies on MASCOT's security)

*Verification:* The gate counts (992 mult. triples, depth 124 for arithmetic) are consistent with the theoretical analysis: 32 rounds × 16 S-boxes × 2 mults + overhead = 992.


== Experimental Assessment

#score-box("Experimental Score", "7", max-score: 10)

The experimental evaluation is comprehensive but has some gaps.

*Positive aspects:*
- Clear experimental setup (Apple M1 Max, LAN network)
- Both single-block and amortized multi-block evaluation
- Scaling analysis from 2 to 10 parties
- Separation of offline and online phase costs

*Concerns:*
- Only LAN setting evaluated (no WAN with realistic latency)
- Apple M1 Max is not representative of IoT devices
- Missing comparison with other lightweight ciphers (SKINNY, PRESENT, GIFT)
- No memory/storage overhead analysis for preprocessing
- Statistical significance not reported (standard deviation, confidence intervals)

*Suggestion:* Include experiments on resource-constrained platforms or simulation of IoT network conditions to strengthen IoT relevance.


== Writing Quality Assessment

#score-box("Writing Quality Score", "7", max-score: 10)

The paper is generally well-written with clear structure.

*Strengths:*
- Logical organization following standard cryptography paper structure
- Good use of figures (Fig. 1, 2, 3) to illustrate concepts
- Tables effectively summarize key results

*Areas for improvement:*
- Introduction is somewhat lengthy; could be more focused
- Some notation introduced but not immediately used (e.g., $cal(Q)$ permutation details)
- Related work section could better differentiate from prior MPC-cipher implementations
- Minor grammatical issues ("There needs to be more work" -> "More work is needed")

= Specific Revision Suggestions

== Major Issues

+ *Add WAN Experiments:* The current LAN-only evaluation limits practical relevance. Include experiments with simulated WAN latency (e.g., 50-100ms RTT) to demonstrate real-world applicability for distributed IoT systems.

+ *Comparative Analysis with Other Ciphers:* Compare arithmetic circuit performance of CRAFT with other lightweight ciphers (SKINNY, PRESENT, GIFT, SIMON/SPECK) to contextualize the contributions and help practitioners choose appropriate ciphers.

+ *Security Discussion:* While MASCOT provides active security, explicitly discuss:
  - Attack model and trust assumptions for IoT deployment
  - Impact of cheating probability selection ($2^(-40)$ vs $2^(-128)$)
  - How the threshold setting interacts with IoT device compromise scenarios

+ *IoT Platform Evaluation:* The Apple M1 Max benchmark does not represent IoT constraints. Include either:
  - Actual experiments on constrained devices (Raspberry Pi, ESP32)
  - Clear justification for why high-end hardware evaluation generalizes to IoT


== Minor Issues

+ *Notation Consistency:* Use consistent notation for finite fields throughout (sometimes $FF_(2^4)$, sometimes $FF_2[X]/(X^4+X+1)$).

+ *Figure 3 Clarity:* The implementation chain figure could be improved with explicit labels for intermediate values and clearer distinction between multiplication and linear operations.

+ *Table VII Data:* Add percentage improvement column to make amortization benefits immediately visible.

+ *Related Work Gap:* Briefly discuss MPC implementations of other NIST lightweight candidates beyond the 2PC work by Mandal and Gong.

+ *Algorithm 2 Complexity:* State the computational complexity ($O(2^(40))$ field elements to check) and runtime.

+ *Grammar:*
  - Line 1-2 of Introduction: "I\nN recent years" appears to be a formatting artifact
  - "There needs to be more work" -> "More work is needed"
  - Consistent use of "data" (singular/plural)


= Review Comments

== Comments to Authors

The paper proposes an arithmetic-circuit-based MPC implementation of the CRAFT block cipher for IoT systems, utilizing CRV decomposition to optimize the S-box evaluation. The overall concept of applying arithmetic circuit representations to lightweight ciphers for efficient MPC execution is interesting and relevant to threshold cryptography in IoT; however, the experimental evaluation is limited to LAN settings without IoT-representative platforms, and the novelty is constrained by the reliance on existing techniques (CRV decomposition, MASCOT protocol). While the performance improvements are promising, several issues need to be addressed to strengthen the contribution and demonstrate practical applicability.

1. *WAN Evaluation:* The current experiments are conducted only in LAN settings. To demonstrate practical relevance for distributed IoT systems, experiments with realistic WAN latency (e.g., 50-100ms RTT) should be included.

2. *Comparative Analysis:* The performance comparison is limited to boolean vs. arithmetic circuit implementations of CRAFT only. A comparison with other lightweight ciphers (SKINNY, PRESENT, GIFT, SIMON/SPECK) under the same MPC framework would better contextualize the contributions.

3. *IoT Platform Evaluation:* The Apple M1 Max benchmark does not represent IoT device constraints. Experiments on resource-constrained platforms (Raspberry Pi, ESP32) or clear justification for generalization to IoT environments are needed.

4. *Security Discussion:* While MASCOT provides active security, the paper should explicitly discuss the attack model and trust assumptions specific to IoT deployment, including the impact of cheating probability selection ($2^(-40)$ vs $2^(-128)$).

5. *Algorithm Complexity:* Algorithm 2 (finding lowest-cost embedding) lacks complexity analysis. The computational cost ($O(2^(40))$ field elements) and practical runtime should be stated.

6. *Memory Overhead:* The analysis focuses on communication and runtime but omits memory consumption and preprocessing storage requirements, which are critical for resource-constrained IoT devices.

7. *Notation Consistency:* Use consistent notation for finite fields throughout the paper (sometimes $FF_(2^4)$, sometimes $FF_2[X]/(X^4+X+1)$).

8. *Figure Clarity:* Figure 3 (implementation chain) should include explicit labels for intermediate values and clearer distinction between multiplication and linear operations.

== Confidential Comments to Editor

This paper addresses a relevant problem for IoT security but has significant gaps in experimental validation. The core techniques (CRV decomposition, MASCOT protocol) are from prior work, and the paper applies them to CRAFT without substantial methodological innovation. The LAN-only evaluation and lack of IoT platform experiments limit the practical relevance claimed by the title.

Recommendation: *Major Revision* - The paper requires substantial additional experiments (WAN settings, comparative cipher analysis, IoT platforms) and clearer positioning of the contribution. The current form does not sufficiently demonstrate the claimed IoT applicability.

The paper fits within IEEE IoT Journal's scope but needs significant strengthening before publication.

// Bibliography section
// #bibliography("../references.bib", style: "apa")
