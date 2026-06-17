# Resume Builder — Claude AI Skill

> Built by [Saleh Abbaas](https://linkedin.com/in/salehabbaas) · [github.com/salehabbaas](https://github.com/salehabbaas)

An advanced AI-powered resume builder skill for [Claude (Cowork / Claude Code)](https://claude.ai). Paste a job description, answer two questions, and get a professionally designed, ATS-scored, two-page resume with a matching cover letter — in both PDF and DOCX — in under a minute.

---

## What Makes This Different

Most resume tools are glorified templates. This skill is a full reasoning engine:

- **JD analysis before writing** — extracts required skills, domain keywords, seniority level, and company context before generating a single word
- **Technology traceability** — every core JD requirement must be traceable to an actual bullet, not just listed in the Skills section
- **Employer block integrity** — no employer block ever splits across pages, guaranteed
- **ATS scoring with risk level** — full score, matched keywords, missing keywords, suggested fixes, and a short recommendation
- **Interactive Elicitation flow** — three structured choices (build mode, output mode, bullet style) before generation
- **QA report on every build** — 14-point validation checklist returned before delivery; if anything fails, it regenerates automatically
- **WHY.md decision doc** — every build ships a written rationale: which employers, certs, and projects were included and why
- **Two output formats** — PDF (via ReportLab) and DOCX (via python-docx), always both, always matching

---

## File Structure

```
resume-builder/
├── SKILL.md           # All rules, commands, and workflows — the brain
├── RESUME_STYLES.md   # 6 named visual styles with colors, fonts, layout specs
├── MY_INFO.md         # Your personal data (gitignored — never committed)
├── FEEDBACK.md        # Learning log from past builds (gitignored — kept local)
├── agents/            # Agent definitions (e.g. openai.yaml) for cross-platform use
├── README.md          # This file
├── AGENTS.md          # Project instructions for Codex / Cowork imports
└── .gitignore         # Excludes MY_INFO.md, FEEDBACK.md, built files, output folders
```

The core files work together. `SKILL.md` orchestrates everything. `MY_INFO.md` holds your data. `RESUME_STYLES.md` controls the design. `FEEDBACK.md` accumulates lessons from past builds and is read at the start of every session.

---

## Installation

### Option 1 — Import as a Claude Skill (Cowork / Claude Code)

1. Clone or download this repo
2. Create your own `MY_INFO.md` using the template below
3. Zip the skill files flat at the root — no subfolder:
   ```bash
   zip -r resume-builder.zip SKILL.md RESUME_STYLES.md MY_INFO.md agents/
   ```
4. In Claude: **Settings → Skills → Import Skill** → upload the zip
5. The skill appears as `resume-builder` and is ready

> The zip must contain `SKILL.md` at the root level. Do not nest inside a subfolder. `MY_INFO.md` is your private data — include it in your own zip, but it is gitignored and never committed to the repo.

### Option 2 — Use directly in any Claude session

Paste the contents of `SKILL.md`, `MY_INFO.md`, and `RESUME_STYLES.md` into a Claude conversation and start with `/resume`.

---

## MY_INFO.md Template

Create this file with your own data. It is gitignored and never committed.

```markdown
---
name: resume-my-info
description: Personal data for [Your Name] resume building.
---

# My Info — [Your Name]

## IDENTITY
- **Full Name:** [Your Full Name]
- **Phone:** [Your Phone]
- **Email:** [Your Email]
- **LinkedIn:** linkedin.com/in/[yourhandle]
- **GitHub:** github.com/[yourhandle]
- **Location:** [Your City, Province/State, Country]
- **Resume city rule:** [Optional — e.g. "Always match the JD's city in the contact header." Omit to always use your home Location.]
- **Max experience claim:** [Optional — e.g. "5+ years (hard cap)". The skill never exceeds this in any Summary or cover letter.]
- **Languages:** [e.g. English (Native) | French (Conversational)]

## EDUCATION
**[Degree Title]**
[Institution], [City]
[Start Year] - [End Year]

## CERTIFICATES
- [Certificate Name] | [Issuer] | [Month Year]
- ...

## WORK EXPERIENCE

### Job 1 — [Company Name]
**Display title on resume:** [Job Title]
**Dates:** [Mon Year] - [Mon Year]
**Location:** [City, Country]
**Always include:** Yes

**Raw facts:**
- [Fact 1 — what you built, what happened, numbers]
- [Fact 2]
- ...

**Key tools:** [Tool1] | [Tool2] | [Tool3]

### Job 2 — [Company Name]
...

## PROJECTS
| Project | Best for |
|---|---|
| [Project Name] | [Role type, technologies] |
...
```

---

## How to Use

### The Build Flow

```
You: /resume

Claude: Please paste the full job description.

You: [paste JD]

Claude: [Elicitation — 3 choices]
  1. AutoResume or StepResume?
  2. Generate with ATS / Just ATS / Just Generate?
  3. FullPoints or OnePoints?

Claude: [Builds resume, returns QA report and ATS score]
        "Here's the resume! Any feedback or suggestions?"
```

### All Commands

| Command | What it does |
|---|---|
| `/resume` | Full build with Elicitation flow |
| `/resume --style=navy` | Build with a specific style |
| `/resume --font=arial` | Use Arial instead of Calibri |
| `/cover-letter` | Build a standalone cover letter |
| `/ats-check` | ATS analysis against a JD |
| `/update-resume` | Update and rebuild an existing resume |
| `/show-styles` | List all 6 visual styles |
| `/show-certs` | List certs with role selection rules |
| `/show-projects` | List projects with best-fit role tags |
| `/add-experience` | Add a job to MY_INFO.md |
| `/add-cert` | Add a certificate |
| `/add-project` | Add a project |
| `/update-info` | Update any section of MY_INFO.md |
| `/update-rules` | Propose a rule change (Claude confirms first) |

---

## Visual Styles

Six named styles. Choose with `--style=<flag>`:

| Style | Flag | Best for |
|---|---|---|
| Minimal Elegant | `--style=elegant` | Default. All roles. Clean, ATS-safe, rust accent. |
| Navy Classic | `--style=navy` | Corporate, banking, government, consulting. |
| Teal Modern Two-Column | `--style=teal` | Startups, SaaS, product companies. |
| Forest Executive | `--style=executive` | Senior, director-level, healthcare executive. |
| Purple Tech | `--style=purple` | FAANG, big tech, heavy ATS screening. |
| Minimal Monochrome | `--style=mono` | Academic, research, data science. |

---

## What Gets Validated Before Delivery

Every build returns a 14-point QA report. Nothing is delivered until all pass:

```
Resume PDF page count: 2 pages             [ PASS / FAIL ]
DOCX spacing compact (single, 0-2pt):      [ PASS / FAIL ]
Header rule absent (unless requested):     [ PASS / FAIL ]
Contact info in body (not header/footer):  [ PASS / FAIL ]
Employer blocks split:                     [ YES / NO    ]
Education & Certifications split:          [ YES / NO    ]
Section headers never orphan from content: [ PASS / FAIL ]
Certificates relevant to JD:               [ PASS / FAIL ]
Required JD technologies with evidence:    [ PASS / FAIL ]
Primary tech traceable in bullets:         [ PASS / FAIL / N/A ]
No em dashes in any file:                  [ PASS / FAIL ]
All 5 output files created:                [ PASS / FAIL ]
Section order correct:                     [ PASS / FAIL ]
Market rules applied (Canada/US):          [ PASS / FAIL ]
```

---

## Key Rules (Summary)

- **2 pages exactly.** Always. No exceptions.
- **No em dashes anywhere.** Ever. Rewrite the sentence instead.
- **Employer blocks never split.** If it doesn't fit, move the whole block to page 2.
- **Education & Certs never split** across pages.
- **Technology traceability.** Core JD skills must appear in bullets, not just the Skills section.
- **No fabrication.** If a technology is not in MY_INFO.md, ask the user before adding it.
- **No unrelated certificates.** If the JD doesn't ask for it, leave it out.
- **Languages line only when JD requires it.** Otherwise omit.
- **ATS scoring** with matched, missing, risk level, and recommendation — unless user chose Just Generate.
- **All 5 files always:** resume PDF + DOCX, cover letter PDF + DOCX, and WHY.md decision doc.

---

## Tech Stack

| Layer | Technology |
|---|---|
| PDF generation | [ReportLab](https://www.reportlab.com/) (Python) |
| DOCX generation | [python-docx](https://python-docx.readthedocs.io/) (Python) |
| Skill orchestration | [Claude AI](https://claude.ai) (Anthropic) |
| Interactive flow | Claude Elicitation (Cowork / Claude Code) |

---

## About the Author

**Saleh Abbaas** is a Software Engineer and Programmer Analyst with 5+ years of experience across healthcare IT, public health systems, and backend engineering. He built this skill to automate and standardize the resume process when applying across different domains and roles — and open-sourced it so other engineers can use it too.

- LinkedIn: [linkedin.com/in/salehabbaas](https://linkedin.com/in/salehabbaas)
- GitHub: [github.com/salehabbaas](https://github.com/salehabbaas)
- Email: abbas-sal@hotmail.com

---

## License

MIT — free to use, adapt, and share. A mention or star is appreciated if this helped you.
