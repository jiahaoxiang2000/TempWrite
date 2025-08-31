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
  title: "SiWB: A 28nm 800MHz 4.2-to-14.2Gbps/W Configurable Multi-core Architecture for White-box Block Cipher with Area-efficient Random Linear Transformation and Load-aware Inter-core Scheduling",
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
    [SiWB: A 28nm 800MHz 4.2-to-14.2Gbps/W Configurable Multi-core Architecture for White-box Block Cipher with Area-efficient Random Linear Transformation and Load-aware Inter-core Scheduling],

    [*Manuscript ID:*], [JSSC-25-0198],
    [*Journal/Conference:*], [IEEE Journal of Solid State Circuits],
  )
])

#v(1em)

= Quick read Paper Information

== Authors and Affiliations
- **Primary Authors:** Xiangren Chen, Bohan Yang, Wenping Zhu, Hanning Wang, Jinjiang Yang, Min Zhu, Aoyang Zhang, Leibo Liu
- **Primary Institution:** Beijing National Research Center for Information Science and Technology (BNRist), School of Integrated Circuits, Tsinghua University, China
- **Secondary Institution:** Wuxi Micro Innovation Integrated Circuit Design Co., Ltd.
- **Manuscript ID:** JSSC-25-0198

== Paper Overview
This paper presents SiWB, the first 28nm silicon-proven hardware accelerator for white-box block ciphers. The work addresses Dedicated White-Box Block Ciphers (DWBC) which provide cryptographic security even when adversaries have full control of the execution environment. The design achieves significant performance improvements over software implementations.

== Key Technical Contributions
1. **First Silicon-Proven Multi-core WBC Accelerator:** Complete system with multiple hardware cores, achieving 28nm TSMC fabrication
2. **Load-aware Inter-core Scheduling:** Out-of-order data dispatcher and in-order data recycler for optimal resource utilization
3. **Configurable Area-efficient Datapath:** Supports multi-size random linear transformation (LT) and non-linear transformation (NLT)
4. **Algorithm-Hardware Co-design:** Novel vectorized bit-serial modular multiplication with reduced critical path

== Technical Approach
- **Target Ciphers:** SPNbox-8/16/24/32, Yoroi-16/32, WARX (Dedicated White-Box Block Ciphers)
- **Process Technology:** TSMC 28nm HPC process
- **Architecture:** Multi-core with batched-processing for intra-core parallelization
- **Security Model:** White-box cryptography with provable security against key extraction attacks

== Performance Highlights
- **Silicon Area:** 1.8mm² in 28nm process
- **Operating Frequency:** 800MHz peak at 0.9V
- **Peak Throughput:** 11.4 Gbps
- **Energy Efficiency:** Up to 14.2 Gbps/W
- **Speedup:** 389× average speedup vs. AES-NI optimized software on 3.4GHz CPU

== Application Domain
- **Primary Applications:** Streaming media requiring Gbps throughput, digital rights management (DRM)
- **Target Use Cases:** Mobile payment, IP protection, content protection under security-critical scenarios
- **Security Advantage:** Maintains secret key protection even with full adversarial control of execution environment

= Review Summary

This paper presents SiWB, the first silicon-proven multi-core hardware accelerator for Dedicated White-Box Block Ciphers (DWBC). The work addresses a critical performance bottleneck in white-box cryptography, achieving significant improvements in throughput and energy efficiency through innovative multi-core architecture and algorithm-hardware co-design.

== Strengths

1. **Pioneering Silicon Implementation**: First 28nm silicon-proven accelerator for white-box block ciphers, validating practical feasibility beyond simulation
2. **Comprehensive Multi-core Architecture**: Load-aware inter-core scheduling with out-of-order dispatch and in-order retrieval mechanisms
3. **Strong Performance Results**: 11.4 Gbps peak throughput, 14.2 Gbps/W energy efficiency, 389× average speedup vs. optimized software
4. **Algorithm-Hardware Co-design**: Novel LSB-first vectorized modular multiplier with shorter critical path than prior work
5. **Flexibility**: Supports 7 DWBC algorithms (SPNbox, Yoroi, WARX) with configurable parameters

== Areas for Improvement

1. **Limited Security Analysis**: Insufficient discussion of side-channel resistance beyond timing attacks
2. **Comparison Scope**: Limited comparison with other multi-core cryptographic accelerators
3. **Power Analysis**: Lacks detailed power breakdown analysis across different operating conditions
4. **Scalability Discussion**: Limited analysis of scaling beyond 10 cores


= Detailed Review

== Innovation Assessment

#score-box("Innovation Score", "8", max-score: 10)

=== Technical Innovation Highlights

1. **First Silicon-Proven DWBC Accelerator**: This represents a significant milestone as the first 28nm fabricated processor specifically designed for white-box cryptography, moving beyond simulation-based studies.

2. **Novel Multi-core Architecture**: The load-aware scheduler with out-of-order dispatch and in-order retrieval is well-designed for handling variable execution times across different DWBC algorithms.

3. **Advanced Vectorized Modular Multiplier**: The LSB-first bit-serial approach achieves shorter critical path compared to Montgomery reduction (UpWB), with configurable support for multiple bit-widths (4/8/16/24/32-bit).

4. **Algorithm-Hardware Co-optimization**: Effective integration of batched processing with nested loop dependency handling, achieving near 100% hardware utilization.

=== Innovation Assessment

**Strengths:**
- Addresses real bottleneck in white-box cryptography adoption
- Multi-dimensional configurability (algorithms, bit-widths, matrix dimensions)
- Comprehensive system-level integration with SoC components
- Novel scheduling mechanisms applicable beyond cryptography

**Areas for Enhancement:**
- Limited discussion of dynamic reconfiguration capabilities during runtime
- Could explore heterogeneous core architectures for different DWBC types


== Technical Quality Assessment

#score-box("Technical Quality Score", "7", max-score: 10)

=== Architecture Design Analysis

**Multi-core Scheduling (Excellent)**
- Out-of-order dispatch with in-order retrieval effectively handles variable execution times
- Comprehensive status tracking (ibuffer, work_state, obuffer, order trackers)
- Batched processing achieves near 100% hardware utilization with 6-way interleaving

**Datapath Optimization (Very Good)**
- LSB-first modular multiplier reduces critical path vs. Montgomery approach
- Combined S-box implementation achieves good area-latency balance
- Multi-scale matrix support (4×4 to 16×16) with efficient resource reuse

**System Integration (Good)**
- Complete SoC integration with RISC-V, DMA, SRAM, UPIF
- Proper interface design for high-speed external communication
- SHAKE-128 integration for key derivation

=== Technical Concerns

1. **Security Analysis Depth**: Limited discussion of physical side-channel vulnerabilities beyond timing
2. **Critical Path Analysis**: Insufficient detail on worst-case timing paths across different configurations
3. **Memory Hierarchy**: Limited analysis of memory bandwidth requirements and potential bottlenecks
4. **Thermal Considerations**: No discussion of thermal management at high utilization rates

=== Implementation Robustness

**Verification Coverage**: Adequate but could benefit from more comprehensive corner case analysis
**Design Methodology**: Sound approach with proper algorithm-hardware co-design principles
**Scalability**: Good foundation but limited exploration of scaling characteristics


== Experimental Assessment

#score-box("Experimental Quality Score", "9", max-score: 10)

=== Silicon Validation Results (Excellent)

**Physical Implementation**
- Successfully fabricated in TSMC 28nm HPC process
- Die area: 5.8mm² (total), 1.8mm² (SiWB processor core)
- Operating range: 0.7V-1.1V, 400MHz-1100MHz
- Comprehensive test setup with oscilloscope measurement validation

**Performance Metrics (Outstanding)**
- Peak throughput: 11.4 Gbps (SPNbox-32)
- Average throughput: 7.8 Gbps across 7 algorithms
- Energy efficiency: 4.2-14.2 Gbps/W range
- Speedup: 389× average vs. AES-NI optimized software on 3.4GHz CPU

=== Comparison Analysis (Very Good)

**Benchmark Coverage**
- Comprehensive comparison with prior silicon-proven works
- Normalized energy efficiency accounting for process technology differences  
- Fair comparison methodology using AES-NI optimized software baseline

**Areas of Strength**
- First-ever silicon validation for DWBC accelerators
- Extensive algorithm support (SPNbox-8/16/24/32, Yoroi-16/32, WARX)
- Detailed power and area breakdown analysis
- Voltage scaling characterization from 0.7V to 1.1V

=== Experimental Limitations

1. **Temperature Variation**: Results only at room temperature (25°C)
2. **Limited Comparison Scope**: Few directly comparable DWBC implementations
3. **Security Evaluation**: Lacks empirical side-channel resistance testing
4. **Scalability Testing**: No evaluation beyond 10-core configuration


== Writing Quality Assessment

#score-box("Writing Quality Score", "8", max-score: 10)

=== Organization and Clarity (Very Good)

**Paper Structure**
- Well-organized with logical flow from motivation to results
- Clear section transitions and comprehensive background
- Effective use of figures and tables to support technical content
- Good balance between high-level concepts and implementation details

**Technical Presentation**
- Algorithm descriptions are clear with appropriate mathematical notation
- Architecture diagrams effectively illustrate complex multi-core design
- Performance results are well-presented with meaningful comparisons
- Comprehensive experimental setup documentation

=== Language and Technical Writing

**Strengths**
- Generally clear and precise technical language
- Appropriate use of domain-specific terminology
- Good mathematical formulation of algorithms
- Effective integration of related work throughout

**Areas for Improvement**
- Some sentences could be more concise (particularly in Section II)
- Occasional minor grammatical inconsistencies
- Some technical details could benefit from clearer explanation
- Limited discussion of future work and broader implications

=== Presentation Quality

**Figures and Tables**: High quality with clear labels and captions
**References**: Comprehensive and appropriate citation of related work
**Reproducibility**: Good documentation of experimental setup and parameters

= Specific Revision Suggestions

== Major Issues

1. **Security Analysis Insufficient**: The paper lacks comprehensive security evaluation beyond timing attack resistance. Critical concerns include:
   - No empirical evaluation of power-based side-channel attacks
   - Limited discussion of fault injection vulnerabilities
   - Insufficient analysis of information leakage through power consumption patterns
   - Missing evaluation of electromagnetic emanation resistance

2. **Scalability Analysis Missing**: The work does not provide adequate analysis of scaling characteristics:
   - No performance modeling for configurations beyond 10 cores
   - Limited discussion of interconnect bottlenecks at higher core counts
   - Missing analysis of memory bandwidth requirements scaling
   - Insufficient exploration of load balancing effectiveness at scale

3. **Temperature and Process Variation**: Results are only provided at nominal conditions:
   - No evaluation across temperature ranges (-40°C to 125°C)
   - Missing process corner analysis (SS, FF, SF, FS)
   - No aging effects consideration for long-term operation
   - Limited voltage scaling analysis beyond basic characterization


== Minor Issues

1. **Presentation and Clarity**:
   - Figure 3 caption could be more descriptive about specific design challenges
   - Algorithm 2 formatting could be improved for better readability
   - Some mathematical notation inconsistencies (e.g., Vec_A vs Vec A)
   - Table I could benefit from clearer column headers

2. **Technical Details**:
   - Missing discussion of worst-case critical path analysis
   - Limited explanation of UPIF interface specifications
   - Insufficient detail on SHAKE-128 implementation optimizations
   - Could benefit from more detailed area breakdown per functional unit

3. **Experimental Methodology**:
   - Software baseline comparison could include more recent optimizations
   - Missing discussion of measurement uncertainty and confidence intervals
   - Limited analysis of power measurement accuracy
   - Could benefit from energy-delay product analysis

4. **Future Work Discussion**:
   - Limited exploration of potential improvements and extensions
   - Missing discussion of integration with existing security frameworks
   - Could benefit from analysis of emerging DWBC algorithms support


= Review Comments

#comment-box("Overall Assessment", [
This paper presents a significant contribution to white-box cryptography by delivering the first silicon-proven multi-core accelerator for DWBCs. The work demonstrates excellent engineering with strong performance results and comprehensive system integration. The technical innovation in multi-core scheduling and vectorized arithmetic units is noteworthy and addresses real bottlenecks in white-box cryptography adoption.
])

#comment-box("Recommendation", [
**Accept with Minor Revisions**

The paper makes substantial contributions to the field and demonstrates solid technical execution. The silicon validation adds significant credibility to the results. While there are areas for improvement (particularly in security analysis), the overall contribution merits publication.
])

#comment-box("Suggested Revisions", [
1. **Expand Security Analysis**: Add discussion of physical security considerations and potential countermeasures against side-channel attacks

2. **Improve Scalability Discussion**: Provide analysis or projections for scaling beyond 10 cores, including potential bottlenecks and solutions

3. **Add Temperature Analysis**: Include at least basic characterization across temperature range, or acknowledge this limitation

4. **Enhance Comparison**: Compare with other multi-core cryptographic processors beyond just DWBC-specific works

5. **Clarify Technical Details**: Address minor presentation issues and provide more implementation details for reproducibility
])

#comment-box("Significance and Impact", [
This work has the potential to significantly impact the adoption of white-box cryptography in practical applications. The demonstrated Gbps-level throughput makes DWBC viable for streaming media and other high-bandwidth applications. The comprehensive system-level approach and silicon validation provide a solid foundation for future research and commercial development.
])

== Final Scoring Summary

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#score-box("Innovation", "8")],
  [#score-box("Technical Quality", "7")],
  [#score-box("Experimental Validation", "9")],
  [#score-box("Writing Quality", "8")],
)

#align(center, [#score-box("Overall Score", "8", max-score: 10)])



// Bibliography section
// #bibliography("../references.bib", style: "apa")
