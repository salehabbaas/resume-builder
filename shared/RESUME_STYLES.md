---
name: resume-styles
description: All resume design styles, fonts, colors, and layout specifications for Saleh Abbaas resume building. Load alongside SKILL.md to access any named style. ReportLab (PDF) and python-docx (DOCX) implementation details included for each style.
---

# Resume Styles — Design Reference

> Load this file alongside SKILL.md before building any resume.
> Default style is Minimal Elegant unless overridden with `/resume --style=<name>`.
> To add a new style use `/add-style`.

---

## FONTS

### Default Fonts
| Role | Font | Notes |
|---|---|---|
| **Primary (default)** | Calibri | All body text, bullets, skills lines |
| **Secondary** | Arial | Request with `--font=arial` |
| PDF fallback | Helvetica | ReportLab built-in — closest to Arial |
| DOCX | Calibri | Always available natively in python-docx |

Override font per build: `/resume --font=arial`

### Font Size Scale — STANDARD (apply to all styles unless noted)
| Element | Size |
|---|---|
| Name | 22pt |
| Job title (header) | 10.5-11pt |
| Contact line | 8-8.5pt |
| Section headers | 14pt bold |
| Job title (experience) | 12.5-13pt bold |
| Company / dates | 10pt |
| Body / bullets | 11-12pt |
| Skills line | 10pt |

### Header Spacing — CRITICAL
- Name paragraph: spaceAfter = 8pt minimum
- Job title paragraph: spaceBefore = 4pt, spaceAfter = 4pt minimum
- Contact paragraph: spaceBefore = 2pt
- Never let name and title run into each other — always check leading

---

## STYLES

---

### Style 1: Minimal Elegant — DEFAULT
**Flag:** `--style=elegant`
**Use for:** All roles. ATS-safe, clean, professional.
**Vibe:** Refined, understated, confident. Rust accent gives warmth without being flashy.

**Colors:**
| Element | Hex | RGB |
|---|---|---|
| Name | `#2C2C2C` Charcoal | 44, 44, 44 |
| Accent / section headers / rules | `#C0392B` Rust | 192, 57, 43 |
| Company / dates / contact | `#4A5568` Dark gray | 74, 85, 104 |
| Body text | `#1C1C1C` Near black | 28, 28, 28 |

**Layout:**
- Single column
- Centered name + title + contact header
- Thick charcoal rule under header (2pt)
- Thin rust rule under each section header (0.8pt)
- Margins: 0.62" left/right | 0.46" top | 0.43" bottom
- Bullets: round •

**ReportLab:**
```python
CHARCOAL = colors.HexColor("#2C2C2C")
RUST     = colors.HexColor("#C0392B")
MID      = colors.HexColor("#4A5568")
BLACK    = colors.HexColor("#1C1C1C")
```

---

### Style 2: Navy Classic
**Flag:** `--style=navy`
**Use for:** Corporate, banking, government, consulting, senior roles.
**Vibe:** Traditional, authoritative, trustworthy.

**Colors:**
| Element | Hex |
|---|---|
| Name | `#1A2B4A` Deep navy |
| Accent / rules | `#2E6DA4` Medium blue |
| Company / dates | `#4A5568` Dark gray |
| Body text | `#1C1C1C` Near black |

**Layout:**
- Single column
- Left-aligned name (not centered)
- Navy bold rule under name (2.5pt)
- Blue thin rule under section headers (1.5pt)
- Name size: 22pt (standard scale)
- Bullets: round •

**ReportLab:**
```python
NAVY   = colors.HexColor("#1A2B4A")
ACCENT = colors.HexColor("#2E6DA4")
GRAY   = colors.HexColor("#4A5568")
BLACK  = colors.HexColor("#1C1C1C")
```

---

### Style 3: Teal Modern Two-Column
**Flag:** `--style=teal`
**Use for:** Tech companies, startups, SaaS, product companies.
**Vibe:** Bold, modern, visually distinctive.

**Colors:**
| Element | Hex |
|---|---|
| Sidebar background | `#1E2D40` Dark slate |
| Sidebar accent / headers | `#00A896` Teal |
| Sidebar body text | `#B0B8C1` Cool gray |
| Right content headers | `#1E2D40` Dark slate |
| Right content body | `#1C1C1C` Near black |

**Layout:**
- Two columns: dark sidebar (2.15") left | white content right
- Sidebar contains: name | role | contact | skills | certs | education | languages
- Right column contains: summary | experience | projects
- Sidebar background drawn with ReportLab canvas rect
- Font: Helvetica (PDF) | Arial (DOCX)
- Bullets: round •

**When NOT to use:** Hospitals, government, traditional enterprise — these environments prefer ATS-safe single-column.

**ReportLab:**
```python
DARK  = colors.HexColor("#1E2D40")
TEAL  = colors.HexColor("#00A896")
GRAY  = colors.HexColor("#B0B8C1")
BLACK = colors.HexColor("#1C1C1C")
WHITE = colors.white
```

---

### Style 4: Forest Executive
**Flag:** `--style=executive`
**Use for:** Senior/leadership, healthcare executive, director-level, consulting.
**Vibe:** Prestigious, serious, trust-inspiring.

**Colors:**
| Element | Hex |
|---|---|
| Header band | `#1B4332` Forest green |
| Gold accent rule | `#B7791F` Warm gold |
| Section headers | `#1B4332` Forest green |
| Section rules | `#1B4332` Forest green |
| Body text | `#1A1A1A` Near black |
| Header name/title text | `#FFFFFF` White |
| Header contact text | `#A7C4B5` Soft sage |

**Layout:**
- Single column with full-width colored header band (1.15" tall)
- Gold rule beneath header band (0.045" thick)
- Content begins below the band
- Font: Helvetica (PDF) | Calibri (DOCX)
- Bullets: round •

**ReportLab:**
```python
FOREST = colors.HexColor("#1B4332")
GOLD   = colors.HexColor("#B7791F")
SAGE   = colors.HexColor("#A7C4B5")
BLACK  = colors.HexColor("#1A1A1A")
WHITE  = colors.white
```

---

### Style 5: Purple Tech / ATS-Optimized
**Flag:** `--style=purple`
**Use for:** FAANG, big tech, SWE roles where ATS keyword density matters most.
**Vibe:** Clean, precise, technical. Purple adds character without sacrificing readability.

**Colors:**
| Element | Hex |
|---|---|
| Name | `#0D0D0D` Near black |
| Accent / section headers | `#5B21B6` Deep purple |
| Section rule | `#5B21B6` Deep purple |
| Company / dates | `#4A5568` Dark gray |
| Body text | `#0D0D0D` Near black |

**Layout:**
- Single column
- Left-aligned name (bold, 22pt)
- Purple title below name
- Thick purple rule (3pt) under header
- Thin purple rule (1pt) under section headers
- Bullets: arrow ▸ (instead of round •)
- Font: Helvetica (PDF) | Arial (DOCX)

**ReportLab:**
```python
INK    = colors.HexColor("#0D0D0D")
PURPLE = colors.HexColor("#5B21B6")
GRAY   = colors.HexColor("#4A5568")
```

---

### Style 6: Minimal Monochrome
**Flag:** `--style=mono`
**Use for:** Academic, research, data science, roles requiring zero visual distraction.
**Vibe:** Extremely clean, timeless, rigorous.

**Colors:**
| Element | Hex |
|---|---|
| Name | `#000000` Black |
| Section headers | `#000000` Black |
| Rules | `#CCCCCC` Light gray |
| Company / dates | `#4A5568` Dark gray |
| Body text | `#1A1A1A` Near black |

**Layout:**
- Single column
- Centered name (bold, 22pt)
- Section headers in small caps (simulate with Helvetica-Bold, uppercase)
- Thin gray rules (0.5pt)
- No color — hierarchy created by weight and spacing only
- Font: Calibri (DOCX) | Helvetica (PDF)
- Bullets: round •

**ReportLab:**
```python
BLACK = colors.HexColor("#000000")
LGRAY = colors.HexColor("#CCCCCC")
GRAY  = colors.HexColor("#4A5568")
BODY  = colors.HexColor("#1A1A1A")
```

---

## LAYOUT VARIANTS

| Layout | Used by | ATS compatibility |
|---|---|---|
| Single column | Minimal Elegant | Navy Classic | Forest Executive | Purple Tech | Mono | High |
| Two column | Teal Modern | Medium — avoid for heavy ATS systems |

---

## BULLET STYLES

| Style | Symbol | Used with |
|---|---|---|
| Default round | • | All styles except Purple Tech |
| Arrow | ▸ | Purple Tech only |
| Numbered | 1. 2. 3. | Projects section only, if user requests |
| Em dash | — | Never — signals AI writing |

---

## SPACING REFERENCE

| Element | Space before | Space after |
|---|---|---|
| Section header | 9-10pt | 2pt |
| Job title row | 2pt | 0 |
| Company line | 0 | 2-3pt |
| Bullet | 0 | 1.5-2pt |
| Skills line | 0 | 2pt |
| Between jobs | 4-5pt spacer | — |
| Between sections | 4-5pt spacer | — |

---

## STYLE SELECTION GUIDE

| Role type | Recommended style |
|---|---|
| Software Engineer (general) | Minimal Elegant |
| Backend / Full-Stack at tech company | Purple Tech |
| Healthcare IT | Minimal Elegant or Forest Executive |
| Cloud / DevOps | Navy Classic or Purple Tech |
| Cybersecurity | Navy Classic |
| Senior / Leadership / Director | Forest Executive |
| Startup / SaaS / Product company | Teal Modern Two-Column |
| Data Engineering / Science | Minimal Monochrome or Minimal Elegant |
| Government / Public sector | Navy Classic |
| FAANG / Big Tech | Purple Tech |

---

## HOW TO ADD A NEW STYLE

Use `/add-style` and provide:
1. Style name and flag
2. Color palette (hex for each element)
3. Layout type (single / two-column)
4. Font preference (Calibri / Arial)
5. Special layout features (header band, sidebar, etc.)
6. When to use it / when to avoid it
