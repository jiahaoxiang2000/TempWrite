# CLAUDE - Think Notes Organization Guide

## Content Organization Principles

### File Structure
- **Topic Classification**: Organize content by topic/theme, corresponding to different chapters
- **Time Annotation**: The lowest level headings correspond to specific dates/times
- **Dual Perspective**: Content can be viewed both by topic and by timeline

### File Splitting Strategy
- If a single article becomes too long, split it into a separate file
- Reference the split file in the main document using `#include`
- Avoid exceeding LLM token limits when processing long documents

## File Organization Structure

Use folders to organize content by topic, with date-based file names:

```
think/typst/
├── think-isomo.typ          # Main file
├── references.bib           # Bibliography
├── algorithm/               # Algorithm topic folder
│   ├── 2024-01-15.typ
│   ├── 2024-02-20.typ
│   └── 2024-03-10.typ
├── system-design/           # System design topic folder
│   ├── 2024-01-28.typ
│   └── 2024-02-15.typ
└── paper-review/            # Paper review topic folder
    ├── 2024-01-10.typ
    └── 2024-03-05.typ
```

### Folder Naming Convention
- Use lowercase with hyphens: `algorithm/`, `system-design/`, `paper-review/`
- One folder per main topic

### File Naming Convention
- Within each topic folder, use date format: `YYYY-MM-DD.typ`
- Represents the date when the content was written

## Referencing in Main File

```typst
// In think-isomo.typ, reference sub-files by folder and date
#include "algorithm/2024-01-15.typ"
#include "system-design/2024-02-15.typ"
#include "paper-review/2024-03-05.typ"
```

## Common Library Import

All subfiles should import the common library at the top to access theorem environments and utilities:

```typst
#import "../common.typ": *
```

The `common.typ` file provides:
- Theorem environments (`#theorem`, `#definition`, `#proposition`, `#proof`, etc.) from theorion package
- Custom color scheme (primary-color, secondary-color, accent-color, text-color)
- Colored text shortcuts (`redt()`, `bluet()`, `greent()`)

## Chapter Organization Recommendation

### First File for a Topic (e.g., `algorithm/2024-01-15.typ`)
The **first file** for each topic must start with the common library import and topic-level heading:

```typst
#import "../common.typ": *

= Algorithm

== 2024-01-15

Content for first date...
```

### Subsequent Files for the Same Topic (e.g., `algorithm/2024-02-20.typ`)
Additional files for the **same topic** should import common library but **NOT** repeat the topic heading. Start directly with the date heading:

```typst
#import "../common.typ": *

== 2024-02-20

Content for second date...
```

### Result After Including Both Files
When you include multiple files with the same topic in the main file:

```typst
#include "algorithm/2024-01-15.typ"  // Has = Algorithm
#include "algorithm/2024-02-20.typ"  // Only has == 2024-02-20
```

They will be **merged into a single chapter**:

```
1 Algorithm
  1.1 2024-01-15
      Content for first date...
  1.2 2024-02-20
      Content for second date...
```

This structure maintains topic coherence while clearly showing the timeline progression.
