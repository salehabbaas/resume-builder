---
name: resume-styles
description: All resume design styles, fonts, colors, and layout specifications for Saleh Abbaas resume building. Load alongside RESUME_SKILLS.md to access any named style. ReportLab (PDF) and python-docx (DOCX) implementation code included for each style.
type: user
---

# Resume Styles — Design Reference

> Load this file when building resumes to access any named style.
> Every style must follow the base rules in RESUME_SKILLS.md (2 pages, pipe separators, name casing, etc.)
> Default style is **Minimal Elegant** unless the user requests a different one with `/resume --style=<name>`.

---

## FONTS

### Default Fonts
| Role | Font | Notes |
|---|---|---|
| **Primary (default)** | Calibri | Use for all body text, bullets, skills lines |
| **Secondary** | Arial | Use when a cleaner/more technical look is requested |
| PDF fallback | Helvetica | ReportLab built-in; closest to Arial — use when Calibri unavailable in ReportLab |
| DOCX | Calibri | Always available in python-docx natively |

### Font Size Scale (consistent across all styles)
| Element | Size |
|---|---|
| Name | 22-24pt |
| Job title (header) | 10.5-11pt |
| Contact line | 8-8.5pt |
| Section headers | 9.5pt bold |
| Job title (experience) | 9.5pt bold |
| Company / dates | 8.3-8.6pt |
| Body / bullets | 8.5-9pt |
| Skills line | 8-8.3pt |

---

## STYLES

---

### Style 1: Minimal Elegant ⭐ DEFAULT
**Use for:** All roles. Clean, ATS-safe, professional.
**Vibe:** Refined, understated, confident. Rust accent gives warmth without being flashy.

**Colors:**
| Element | Hex | RGB |
|---|---|---|
| Name | `#2C2C2C` Charcoal | 44, 44, 44 |
| Accent / section headers / rules | `#C0392B` Rust | 192, 57, 43 |
| Company / dates / contact | `#7F8C8D` Mid gray | 127, 140, 141 |
| Body text | `#1C1C1C` Near black | 28, 28, 28 |

**Layout:**
- Single column
- Centered name + title + contact header
- Thick charcoal rule under header (2pt)
- Thin rust rule under each section header (0.8pt)
- Margins: 0.62" left/right | 0.46" top | 0.43" bottom
- Font: Helvetica (PDF) / Calibri (DOCX)

**ReportLab colors:**
```python
CHARCOAL = colors.HexColor("#2C2C2C")
RUST     = colors.HexColor("#C0392B")
MID      = colors.HexColor("#7F8C8D")
BLACK    = colors.HexColor("#1C1C1C")
```

---

### Style 2: Navy Classic
**Use for:** Corporate, banking, government, consulting, senior roles.
**Vibe:** Traditional, authoritative, trustworthy.

**Colors:**
| Element | Hex |
|---|---|
| Name | `#1A2B4A` Deep navy |
| Accent / rules | `#2E6DA4` Medium blue |
| Company / dates | `#555555` Dark gray |
| Body text | `#1C1C1C` Near black |
| Background (left bar if two-col) | `#EAF2FB` Light blue tint |

**Layout:**
- Single column
- Left-aligned name (not centered)
- Navy bold rule under name (2.5pt)
- Blue thin rule under section headers (1.5pt)
- Font: Calibri (DOCX) / Helvetica (PDF)
- Slightly larger name (26pt) to anchor the page

**ReportLab colors:**
```python
NAVY   = colors.HexColor("#1A2B4A")
ACCENT = colors.HexColor("#2E6DA4")
GRAY   = colors.HexColor("#555555")
BLACK  = colors.HexColor("#1C1C1C")
```

---

### Style 3: Teal Modern Two-Column
**Use for:** Tech companies, startups, product companies, creative-adjacent engineering.
**Vibe:** Bold, modern, visually distinctive. Dark sidebar draws the eye.

**Colors:**
| Element | Hex |
|---|---|
| Sidebar background | `#1E2D40` Dark slate |
| Sidebar accent / headers | `#00A896` Teal |
| Sidebar text | `#B0B8C1` Cool gray |
| Right content headers | `#1E2D40` Dark slate |
| Right content body | `#1C1C1C` Near black |

**Layout:**
- Two columns: dark sidebar (2.15") left | white content (4.6") right
- Sidebar: name, role, contact, skills, certs, education, languages
- Right: summary, experience, projects
- Sidebar background drawn with ReportLab canvas rect
- Font: Helvetica (PDF) / Arial (DOCX)

**When to use:** Role at a tech-forward company (startup, SaaS, fintech). Avoid for hospitals, government, or traditional enterprise.

---

### Style 4: Forest Executive
**Use for:** Senior/leadership roles, healthcare executive, director-level, consulting.
**Vibe:** Prestigious, serious, trust-inspiring. Full-width header band adds gravitas.

**Colors:**
| Element | Hex |
|---|---|
| Header band | `#1B4332` Forest green |
| Gold accent rule | `#B7791F` Warm gold |
| Section header text | `#1B4332` Forest green |
| Section rules | `#1B4332` Forest green |
| Body text | `#1A1A1A` Near black |
| Header name/title text | White |
| Header contact text | `#A7C4B5` Soft sage |

**Layout:**
- Single column with full-width colored header band (1.15" tall)
- Gold rule beneath the header band (0.045" thick)
- Content begins below the band
- Font: Helvetica (PDF) / Calibri (DOCX)

**When to use:** Director of Engineering, VP Engineering, Senior Solutions Architect, healthcare leadership.

---

### Style 5: Purple Tech / ATS-Optimized
**Use for:** FAANG, big tech, engineering-heavy companies, SWE roles where ATS matters most.
**Vibe:** Clean, keyword-dense, technical precision. Purple adds personality without sacrificing readability.

**Colors:**
| Element | Hex |
|---|---|
| Name | `#0D0D0D` Near black |
| Accent / section headers | `#5B21B6` Deep purple |
| Section rule | `#5B21B6` Deep purple |
| Company / dates | `#6B7280` Cool gray |
| Body text | `#0D0D0D` Near black |

**Layout:**
- Single column
- Left-aligned name (bold, 22pt)
- Purple title below name
- Thick purple rule (3pt) under header
- Thin purple rule (1pt) under section headers
- Arrow bullets (▸) instead of round bullets
- Font: Helvetica (PDF) / Arial (DOCX)

**When to use:** Amazon, Google, Microsoft, Shopify, Stripe — any company with heavy ATS screening.

---

### Style 6: Minimal Monochrome
**Use for:** Academic, research, data science, or when the user wants zero color distraction.
**Vibe:** Extremely clean, timeless, academic rigor.

**Colors:**
| Element | Hex |
|---|---|
| Name | `#000000` Black |
| Section headers | `#000000` Black |
| Rules | `#CCCCCC` Light gray |
| Company / dates | `#666666` Gray |
| Body text | `#1A1A1A` Near black |

**Layout:**
- Single column
- Centered name (bold, 24pt)
- Small caps section headers
- Very thin gray rules (0.5pt)
- No color anywhere — only weight and spacing create hierarchy
- Font: Calibri (DOCX) / Helvetica (PDF)

---

## LAYOUT VARIANTS

### Single Column (default)
Used by: Minimal Elegant | Navy Classic | Forest Executive | Purple Tech | Minimal Monochrome
- Full width for content — most ATS-compatible
- Works in all file formats
- Recommended for most roles

### Two Column
Used by: Teal Modern Two-Column
- Left sidebar for meta info (contact, skills, certs, education)
- Right column for summary, experience, projects
- Less ATS-compatible — use only for companies known to have human-first review
- Not recommended for: government, healthcare systems, large corporate ATS

---

## BULLET STYLE OPTIONS

| Style | Symbol | Use with |
|---|---|---|
| Default | • Round bullet | All styles except Purple Tech |
| Arrow | ▸ | Purple Tech style |
| Em dash | — | Never — signals AI writing |
| Numbered | 1. 2. 3. | Projects section only if user requests |

---

## SPACING REFERENCE

| Element | Space before | Space after |
|---|---|---|
| Section header | 9-10pt | 2pt |
| Job title row | 0 | 0 |
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
| Backend / Full-Stack (tech company) | Purple Tech |
| Healthcare IT | Minimal Elegant or Forest Executive |
| Cloud / DevOps | Navy Classic or Purple Tech |
| Cybersecurity | Navy Classic |
| Senior / Leadership | Forest Executive |
| Startup / SaaS / Product | Teal Modern Two-Column |
| Data Engineering / Science | Minimal Monochrome or Minimal Elegant |
| Government / Public sector | Navy Classic |
| FAANG / Big Tech | Purple Tech |

---

## HOW TO REQUEST A STYLE

When using `/resume`, you can add a style flag:

```
/resume --style=navy          → Navy Classic
/resume --style=teal          → Teal Modern Two-Column
/resume --style=executive     → Forest Executive
/resume --style=purple        → Purple Tech / ATS
/resume --style=mono          → Minimal Monochrome
/resume --style=elegant       → Minimal Elegant (default)
```

If no `--style` flag is given, always use **Minimal Elegant**.

---

## HOW TO ADD A NEW STYLE

To add a new style to this file, use:
```
/add-style
```
Then provide:
1. Style name
2. Color palette (hex values for each element)
3. Layout type (single/two-column)
4. Font preference
5. Any special layout features
6. When to use it

Claude will add the new style to this file and make it available via `--style=<name>`.
