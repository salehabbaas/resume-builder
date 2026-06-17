# Resume Builder — AI Skill (Claude + Codex)

> Built by [Saleh Abbaas](https://linkedin.com/in/salehabbaas) · [github.com/salehabbaas](https://github.com/salehabbaas)

An advanced AI-powered resume builder skill. Paste a job description, answer two questions, and get a professionally designed, ATS-scored, two-page resume with a matching cover letter, in both PDF and DOCX, in under a minute.

**Two versions — pick the one for your platform:**

| Version | Folder | For |
|---|---|---|
| **Claude** | [`claude/`](claude/) | Claude Code, Cowork, claude.ai. Uses Claude's native skill file resolution. |
| **Codex** | [`codex/`](codex/) | Codex / OpenAI agents. Carries the absolute-path portability rules Codex needs, plus `AGENTS.md` and an `agents/` definition. |

The rules, styles, and workflow are identical in both — only the platform setup (file resolution, invocation, output paths) differs. Use whichever fits your tool.

---

## What Makes This Different

Most resume tools are glorified templates. This skill is a full reasoning engine:

- **JD analysis before writing** — extracts required skills, domain keywords, seniority level, and company context before generating a single word
- **Technology traceability** — every core JD requirement must be traceable to an actual bullet, not just listed in the Skills section
- **Employer block integrity** — no employer block ever splits across pages, guaranteed
- **ATS scoring with risk level** — full score, matched keywords, missing keywords, suggested fixes, and a short recommendation
- **Interactive Elicitation flow** — three structured choices (build mode, output mode, bullet style) before generation
- **QA report on every build** — 19-point validation checklist (incl. a humanization pass) returned before delivery; if anything fails, it regenerates automatically
- **WHY.md decision doc** — every build ships a written rationale: which employers, certs, and projects were included and why
- **Two output formats** — PDF (via ReportLab) and DOCX (via python-docx), always both, always matching

---

## File Structure

```
resume-builder/
├── shared/                    # Single source of truth (edit these)
│   ├── FRONTMATTER.md         # Skill frontmatter (name + description)
│   ├── CORE.md                # All rules, commands, ATS scoring, QA — shared by both
│   └── RESUME_STYLES.md       # 6 named visual styles with colors, fonts, layout specs
├── claude/                    # Claude version — import this for Claude Code / Cowork
│   ├── _platform.md           # Claude-only header: intro + FILE LOCATIONS
│   ├── SKILL.md               # GENERATED = FRONTMATTER + _platform + CORE
│   ├── RESUME_STYLES.md       # GENERATED (copied from shared/)
│   ├── MY_INFO.template.md    # Public template — copy to MY_INFO.md and fill in
│   ├── MY_INFO.md             # Your personal data (gitignored — never committed)
│   └── FEEDBACK.md            # Learning log from past builds (gitignored — kept local)
├── codex/                     # Codex version — use this for Codex / OpenAI agents
│   ├── _platform.md           # Codex-only header: intro + CODEX PORTABILITY
│   ├── SKILL.md               # GENERATED (absolute-path portability rules)
│   ├── RESUME_STYLES.md       # GENERATED (copied from shared/)
│   ├── MY_INFO.template.md
│   ├── AGENTS.md              # Project instructions for Codex
│   └── agents/openai.yaml     # Agent definition
├── build.sh                   # Regenerates both SKILL.md from shared sources
├── README.md                  # This file
└── .gitignore                 # Excludes MY_INFO.md, FEEDBACK.md, built files, output folders
```

In each version, `SKILL.md` orchestrates everything, `MY_INFO.md` holds your data, `RESUME_STYLES.md` controls the design, and `FEEDBACK.md` accumulates lessons that are read at the start of every session.

> **Each `SKILL.md` is generated** by `build.sh` from `shared/FRONTMATTER.md` + the version's `_platform.md` + `shared/CORE.md`. The committed `SKILL.md` files are complete and importable as-is — you only need `build.sh` if you change the rules. See [Editing the rules](#editing-the-rules).

---

## Installation

### Claude (Claude Code / Cowork / claude.ai)

1. Clone or download this repo
2. In `claude/`, copy `MY_INFO.template.md` to `MY_INFO.md` and fill in your data
3. Zip the `claude/` skill files flat at the root — no subfolder:
   ```bash
   cd claude
   zip -r ../resume-builder.zip SKILL.md RESUME_STYLES.md MY_INFO.md
   ```
4. In Claude: **Settings → Skills → Import Skill** → upload the zip
5. The skill appears as `resume-builder` and is ready

> The zip must contain `SKILL.md` at the root level. `MY_INFO.md` is your private data — include it in your own zip, but it is gitignored and never committed to the repo.

**Or use it directly in any Claude session:** paste the contents of `claude/SKILL.md`, your `MY_INFO.md`, and `claude/RESUME_STYLES.md` into a conversation and start with `/resume`.

### Codex / OpenAI agents

1. Clone or download this repo
2. In `codex/`, copy `MY_INFO.template.md` to `MY_INFO.md` and fill in your data
3. Set `SKILL_DIR` (the `codex/` folder) and `RESUMES_DIR` (your output folder) in `codex/AGENTS.md`
4. Invoke the skill with `$resume-builder` and start with `/resume`

> The Codex version reads/writes by absolute path. See `codex/AGENTS.md` and the CODEX PORTABILITY section of `codex/SKILL.md` for setup.

---

## MY_INFO.md Template

Each version ships a ready-to-use template at `claude/MY_INFO.template.md` and `codex/MY_INFO.template.md`. Copy it to `MY_INFO.md` in the same folder and fill in your data — it is gitignored and never committed.

Key optional fields the template documents:
- **Resume city rule** — match the JD's city in the contact header instead of your home city
- **Max experience claim** — a hard cap on the years-of-experience the skill will ever claim
- **Output directory** — absolute path where generated resume folders are written (Claude version)
- Per-job **Always include** / **Include when** — control which jobs appear based on the JD

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

Every build returns a 19-point QA report. Nothing is delivered until all pass:

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
Experience bullets follow 4-part structure:[ PASS / FAIL ]
Humanization pass done (no AI tells/spaces):[ PASS / FAIL ]
Real list bullets (no inline glyphs):      [ PASS / FAIL ]
Identity (name + email) matches company:   [ PASS / FAIL ]
Output nested <YYYY-MM>/<Company>/...:      [ PASS / FAIL ]
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

## Editing the rules

Each version's `SKILL.md` and `RESUME_STYLES.md` are **generated** — never edit them by hand. Change the source, then rebuild:

- **A shared rule** (applies to both versions) → edit `shared/CORE.md`
- **A visual style** → edit `shared/RESUME_STYLES.md`
- **The skill name/description** → edit `shared/FRONTMATTER.md`
- **Something platform-specific** (intro, file paths, invocation) → edit `claude/_platform.md` or `codex/_platform.md`

Then regenerate and verify:

```bash
./build.sh           # rewrites claude/SKILL.md and codex/SKILL.md
./build.sh --check    # CI-friendly: exits non-zero if a committed SKILL.md is stale
```

This keeps the ~95% shared rule set in one place while each version stays a complete, importable bundle.

---

## Tech Stack

| Layer | Technology |
|---|---|
| PDF generation | [ReportLab](https://www.reportlab.com/) (Python) |
| DOCX generation | [python-docx](https://python-docx.readthedocs.io/) (Python) |
| Skill orchestration | [Claude](https://claude.ai) (Claude Code / Cowork) or [Codex](https://openai.com) / OpenAI agents |
| Interactive flow | Native interactive controls on either platform, with chat fallback |

---

## About the Author

**Saleh Abbaas** is a Software Engineer and Programmer Analyst with 5+ years of experience across healthcare IT, public health systems, and backend engineering. He built this skill to automate and standardize the resume process when applying across different domains and roles — and open-sourced it so other engineers can use it too.

- LinkedIn: [linkedin.com/in/salehabbaas](https://linkedin.com/in/salehabbaas)
- GitHub: [github.com/salehabbaas](https://github.com/salehabbaas)
- Email: abbas-sal@hotmail.com

---

## License

MIT — free to use, adapt, and share. A mention or star is appreciated if this helped you.
