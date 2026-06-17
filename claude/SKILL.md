---
name: resume-builder
description: AI-powered resume builder. Builds tailored, ATS-optimized resumes and cover letters from a job description. Supports Canada and US markets, 6 visual styles, interactive setup, old resume parsing, ATS scoring, WHY.md decision docs, and a feedback learning system. Load alongside MY_INFO.md and RESUME_STYLES.md before every session. Use when the user wants to build, update, or analyze a resume.
---

<!-- GENERATED FILE — do not edit this SKILL.md directly. It is assembled by build.sh from
     shared/FRONTMATTER.md + <platform>/_platform.md + shared/CORE.md.
     Edit those source files instead, then run ./build.sh to regenerate. -->

# Resume Builder

An advanced AI resume-building skill for **Claude (Claude Code / Cowork / claude.ai)**. Drop in your data via `MY_INFO.md`, paste a job description, and get a fully tailored, ATS-scored, two-page resume with cover letter in both PDF and DOCX, built to pass modern ATS systems in Canada and the US.

> **Codex / OpenAI user?** Use the `codex/` version of this skill instead — it carries the absolute-path portability rules Codex needs. This `claude/` version is tuned for Claude's skill model.

## FILE LOCATIONS

This is a standard Claude skill. Resolve all persistent files **relative to this skill's own directory** (the folder that holds this `SKILL.md`):
- `MY_INFO.md` — your personal data: identity, experience, certificates, projects. Copy `MY_INFO.template.md` to `MY_INFO.md` and fill it in. It is gitignored and never committed.
- `RESUME_STYLES.md` — 6 visual styles with fonts, colors, layout specs.
- `FEEDBACK.md` — past lessons from previous builds (if it exists). Gitignored.

**Invocation:** the user triggers a build by asking for a resume or by using a `/resume`-style intent. Treat the commands below as task intents, not required slash-command installs.

**Output location:** read `Output directory` from `MY_INFO.md → IDENTITY` if set (otherwise use a `resumes/` directory in the current workspace) — this is the base. Inside it, always nest by month then company: `<base>/<YYYY-MM>/<Company>/Resume_[JobTitle]_[Company]/` (see Identity & Files → Output path for the full rule). Never write generated output into the skill folder itself.

If the surface provides interactive controls, use them for setup choices. Otherwise ask the same questions concisely in chat and continue from the answers.

At the start of every session read `MY_INFO.md`, `RESUME_STYLES.md`, and `FEEDBACK.md` (if present) before generating anything.

---

## FIRST-RUN SETUP

If `MY_INFO.md` is empty/missing, or the user runs `/setup`, read `reference/SETUP.md` and follow it. Otherwise skip this step entirely (do not load it on a normal build).

---

## HOW TO START (After Setup)

1. Read `MY_INFO.md`, `RESUME_STYLES.md`, and `FEEDBACK.md` (if present).
2. If no job description is provided: *"Please paste the full job description."*
3. When a JD is provided, save the exact JD text into the output directory (see the file-location section at the top of this skill) before generating anything.
4. Run JD Analysis, then open the interactive build flow.

---

## COMMANDS

| Command | What it does |
|---|---|
| `/resume` | Full build — JD analysis, interactive flow, all output files in a named folder |
| `/resume --style=<name>` | Build with a specific style: elegant \| navy \| teal \| executive \| purple \| mono |
| `/resume --style=canada` | Force Canada-optimized formatting rules |
| `/resume --style=us` | Force US-optimized formatting rules |
| `/resume --font=arial` | Use Arial instead of default Calibri |
| `/setup` | Run or rerun the first-run setup flow |
| `/update-resume` | Update and rebuild an existing resume |
| `/cover-letter` | Build a standalone cover letter |
| `/ats-check` | Full ATS analysis of an existing resume against a JD |
| `/parse-resume` | Upload an old resume and extract data into MY_INFO.md |
| `/feedback` | Record feedback on the last build |
| `/show-feedback` | Display all FEEDBACK.md entries |
| `/clear-feedback` | Clear all feedback (asks for confirmation) |
| `/apply-lesson` | Manually add a lesson to FEEDBACK.md |
| `/add-experience` | Add a job to MY_INFO.md |
| `/add-cert` | Add a certificate |
| `/add-project` | Add a project |
| `/add-style` | Add a new visual style to RESUME_STYLES.md |
| `/update-info` | Update any section of MY_INFO.md |
| `/update-rules` | Propose a rule change — the skill shows a diff and confirms before saving |
| `/show-styles` | List all 6 visual styles |
| `/show-certs` | List certs with role selection rules |
| `/show-projects` | List projects with best-fit role tags |

---

## JD ANALYSIS — BEFORE WRITING ANYTHING

Before analysis, persist the raw JD text in the resume folder so the original posting is preserved alongside the build artifacts.

Extract from the JD before generating:

- **Target title** — use exactly as the resume job title
- **Required skills** — must appear in the resume with evidence in bullets
- **Preferred / bonus skills** — include only if genuinely present in MY_INFO.md; never force
- **Domain keywords** — phrases the ATS will scan for; use exact terminology from the JD (ATS systems do not recognize synonyms)
- **Certifications mentioned** — only include if JD explicitly asks or domain directly matches
- **Language requirements** — only add languages line if JD mentions it
- **Seniority level** — determines years of experience to claim
- **Main responsibilities** — shapes bullet emphasis
- **Company / product context** — shapes cover letter opening hook

Use this to decide what to include. Nothing enters the resume unless it connects to the JD.

**ATS keyword strategy:** Place the most important JD keywords in the Summary, then again naturally in experience bullets. Important terms appearing 2-3 times across the resume score higher than terms appearing once. Use the exact phrase from the JD — not a synonym, not an abbreviation.

---

## ELICITATION FLOW — INTERACTIVE QUESTIONS

Use interactive controls whenever the platform supports them. Skip questions made unnecessary by earlier answers.

### Step 1 — Build mode
- **AutoResume** — generate automatically with minimal questions
- **StepResume** — build section by section, ask before each section

### Step 2 — Output mode
- **Generate with ATS** — build resume and cover letter, return ATS report
- **Just ATS** — analyze an existing resume against the JD only
- **Just Generate** — build resume and cover letter, skip ATS unless asked later

### Step 3 — Bullet style
- **FullPoints** — complete bullets, multi-line allowed when needed
- **OnePoints** — every bullet one line: "Used A to do B for C" where C = reason or impact

Only ask more questions if the user chose StepResume, or if a genuine ambiguity cannot be resolved from MY_INFO.md or the JD.

---

## CANADA vs US MARKET RULES

Read `Target market` from MY_INFO.md. Apply the correct rules for every build.

### Canada (default unless set otherwise)
- **Date format:** Month Year — `Dec 2024` or `2024-12` (ISO style acceptable)
- **Spelling:** Canadian English — colour, behaviour, centre, programme
- **Page size:** Letter (8.5" × 11")
- **References:** Never include reference names or contact details. "Professional References — Available upon request." is acceptable as a section footer only.
- **Personal info:** Never include photo, age, marital status, SIN, nationality, religion, or ethnic background
- **Length:** 1 page for under 5 years experience; 2 pages for 5+ years. Never 3 pages.
- **Quebec:** If province is Quebec, ask whether the user wants French, English, or bilingual (French first). French is strongly recommended for most Quebec roles.

### United States
- **Date format:** Month Year — `December 2024` or `Dec 2024`
- **Spelling:** American English — color, behavior, center, program
- **Page size:** Letter (8.5" × 11")
- **References:** Never include. Do not add "References available upon request" — considered outdated in US market.
- **Personal info:** Never include photo, age, marital status, SSN, nationality, religion
- **Length:** 1 page for under 10 years experience is common; 2 pages acceptable for senior roles
- **Objective:** Use Professional Summary only — objective statements are outdated in the US market

### Both markets
- Single-column layout strongly preferred for ATS safety
- No tables, text boxes, or graphics in the main body
- No contact info in headers or footers — place in the body of the document
- DOCX is the safest format for ATS parsing; PDF is acceptable but DOCX preferred

---

## CORE RULES

### Identity & Files
- **Identity selection (name + email per company):** if `MY_INFO.md` defines `Identity selection` rules, pick the name and email by matching the JD's company:
  1. If a company-specific override matches the JD company (case-insensitive, substring match — e.g. "Apple"), use that override's name and email.
  2. Otherwise use the `Default` identity (name + email).
  Apply the chosen name and email everywhere: resume header, cover letter header and signature, and the file-name author field. Resolve automatically — never ask. If no `Identity selection` block exists, fall back to `IDENTITY.Full Name` and `IDENTITY.Email`.
- **Name:** the name resolved by Identity selection (or `IDENTITY.Full Name`). First letter of each word capitalized. Never ALL CAPS.
- **Email:** the email resolved by Identity selection (or `IDENTITY.Email`). Use it on both the resume and the cover letter.
- **File name:** `Resume_[FirstName][LastName]_[JobTitle]_[Company].pdf` and `.docx`. Use the resolved name for `[FirstName][LastName]` (e.g. `Sal`, or `SalehAbbaas` when the resolved name is the full name).
- **Output path (REQUIRED nesting):** build this tree inside the configured output directory (see the file-location section at the top of this skill):
  ```
  <output dir>/<YYYY-MM>/<Company>/Resume_[JobTitle]_[Company]/
  ```
  - `<YYYY-MM>` = the month the resume is built, e.g. `2026-06`. Reuse the month folder for every resume built that month.
  - `<Company>` = the JD's company name, cleaned for the filesystem (letters, numbers, spaces → keep; strip `/ \ : * ? " < > |`). Reuse the same company folder for every resume for that company.
  - The innermost `Resume_[JobTitle]_[Company]/` folder holds all 5 files: resume PDF, resume DOCX, cover letter PDF, cover letter DOCX, WHY.md.
  - Create any missing parent folders. Never save to the skill folder or an unrelated current workspace.
- **Versioning:** only the innermost `Resume_[JobTitle]_[Company]/` folder is versioned. If it already exists, do NOT overwrite and do NOT ask — append `_V1`, `_V2`, `_V3`, … incrementing until a free name is found (the `<YYYY-MM>/<Company>/` parents are reused, never versioned). Apply the same version suffix to all 5 output files inside. Example: `2026-06/Fullscript/Resume_SeniorBackendDeveloper_Fullscript/` exists → use `2026-06/Fullscript/Resume_SeniorBackendDeveloper_Fullscript_V1/`.

### Location
- Read all locations from `MY_INFO.md`. Never hardcode locations in this skill.
- Use the exact location recorded per employer. If missing, ask the user.
- **Contact header city:** if `MY_INFO.md` defines a contact-city override rule (e.g., a `Resume city rule` that says to match the JD's city), follow it — extract the city from the JD during JD Analysis and use it in BOTH the resume and cover letter contact header, with the correct province/state abbreviation (Canada: ON, BC, AB, QC; US: NY, CA, TX, etc.). If the JD names no city, fall back to `MY_INFO.md → IDENTITY.Location`. If no override rule is defined, always use `MY_INFO.md → IDENTITY.Location`. Never ask — resolve it automatically.

### Section Order — ATS Optimized (Fixed)
Research confirms this order maximizes ATS parsing and recruiter readability:
1. Contact Information (in body, never in header/footer element)
2. Professional Summary
3. Experience
4. Education & Certifications
5. Projects
6. Skills
7. Professional References

### Page Layout — CRITICAL
- Exactly **2 pages** — no more, no less.
- **Never split one employer block across pages.** An employer block = job title + company/date/location + all bullets + skills line. Move the whole block if it doesn't fit.
- If content runs short: expand bullets, add a relevant project, add a cert. Do not increase font size.
- If content runs long: apply Density Control Order below. Never split an employer block.

### ATS Safety Rules — Based on 2025 Research
- **Single-column layout only** for ATS-safe styles. Two-column layouts (Teal Modern) cause up to 70% ATS parsing failure — warn the user before using this style.
- **No tables** in the main resume body. Tables scramble ATS reading order.
- **No text boxes or graphics.** ATS cannot parse text inside visual elements.
- **No contact info in headers or footers.** Place name, email, phone, and links in the body.
- **No decorative fonts.** Stick to Calibri, Arial, or Helvetica.
- **DOCX preferred over PDF** for ATS submission unless the employer explicitly requests PDF.
- **Exact keyword matching.** ATS does not recognize synonyms. If the JD says "Ruby on Rails," write "Ruby on Rails" — not "Rails," not "RoR."
- **Keyword density.** Top required keywords should appear 2-3 times across the resume (Summary + bullets + Skills section) for maximum ATS scoring.

### Density Control Order
When content is too long, reduce in this order:
1. Remove unrelated certificates
2. Shorten project bullets
3. Remove least relevant project
4. Shorten lower-priority employer bullets
5. Reduce final Skills categories
6. Shorten summary
Never remove the strongest JD-matching content first. Never split an employer block.

### Font & Sizing
- Never change font sizes to force 2 pages. Adjust paragraph spacing only.
- Safe defaults: Name 22-24pt | Title 10.5-11pt | Contact 8-8.5pt | Section headers 9.5pt bold | Job title 9.5pt bold | Company/dates 8.3-8.6pt | Body bullets 8.5-9pt | Skills lines 8-8.3pt
- Never shrink body text below 8.5pt.

### Header Layout
- Structure: Name → Target Title → Contact line → [normal spacing] → Summary
- **No horizontal rule under the contact block** unless user explicitly requests it.
- Contact line must be in the document body — never in a Word header/footer element.

### Separators
- `|` in contact line, company lines, cert lines
- Skills section: **commas**, never pipes
- **NEVER use `—` (em dash) anywhere.** Absolute rule. Rewrite any sentence that calls for one.
- Never use `;` as a separator
- Date ranges: short hyphen — `Dec 2024 - Sep 2025`

### Summary — 5 bullets
Structure (do not change):
```
• [Role] with [X]+ years of experience [specific strength] in [domain].
• [Degree] | [most relevant cert — only if JD mentions certs or cert is strongly relevant].
• Proficient in [JD's primary tech stack — 4-6 tools, most JD-relevant first].
• [Second angle the JD emphasizes].
• [Third supporting strength that closes the argument for this role].
```
- **Languages:** only include if JD mentions language requirements. Otherwise omit.
- Lead proficiency bullet with whatever the JD values most. Use exact JD terminology.
- Every bullet = complete, confident sentence. No fragments.

### Experience — Selection and Content
- **Display title:** read from `MY_INFO.md → Display title on resume` per employer. Never change or infer from JD. If `Display title note` says "do not change," treat as locked.
- **Inclusion:** read each employer's `Always include` and `Include when` from MY_INFO.md. Include if `Always include: Yes` OR if `Include when` matches the JD. Never include by habit.
- Order: newest to oldest.
- Bullets: action + what was built or done + why it mattered or what it enabled.
- Real numbers only — from MY_INFO.md. Never invent metrics.
- **Collaboration:** include at least one bullet reflecting cross-team work or delivery leadership where it genuinely occurred.
- **Primary language:** whatever the JD requires, reflect it naturally where it genuinely exists in MY_INFO.md. Ask user if uncertain. Never fabricate.
- FullPoints: 1.5-2 lines per bullet. OnePoints: one line, "Used A to do B for C."
- Bullet spacing: 2pt spaceAfter minimum.

### Skills Line Per Job
- All-or-nothing: if any job gets a `Skills:` line, every included job gets one.
- 3-6 tools per job, JD-relevant only. Primary JD language or framework listed first.

### Required Technology Coverage
- Extract top required technologies from the JD before writing.
- Each must be traceable to a bullet, project, Skills used line, or Skills section.
- If a technology is required and exists in MY_INFO.md, it must appear in a bullet — not just the Skills section.
- If it is not confirmed in MY_INFO.md, ask the user before adding. Never fabricate.

### Certificates — Strict Relevance
- Only include if JD explicitly mentions certs OR cert directly matches the domain.
- Prefer no certs over unrelated ones. Never include to fill space.
- Order: newest to oldest.

### Education
- Always show full degree title and full date range.
- Keep on one clean line. If it must split: Line 1 = degree title, Line 2 = ` | Institution | Start - End`.
- Never let dates wrap without the ` | ` separator.

### Section Headers — Never Orphan (HARD RULE, ALL SECTIONS)
A section header (e.g., `EDUCATION & CERTIFICATIONS`, `PROJECTS`, `SKILLS`, `PROFESSIONAL REFERENCES`, `EXPERIENCE`) must NEVER appear at the bottom of one page while its content starts on the next page. This is a hard rule and applies to every section in every build.

Implementation requirements:
- **PDF (ReportLab):** wrap the section header flowables together with the first content block in a single `KeepTogether(...)`. For small sections (Education & Certifications, Skills, References, short Projects/Summary lists), wrap the header + entire content in one `KeepTogether(...)`.
- **DOCX (python-docx):** set `w:keepNext` on the section header paragraph AND on the section's horizontal rule paragraph. For small sections that must stay fully together (Education & Certifications, Skills, References), cascade `w:keepNext` on every paragraph in the section EXCEPT the last one — this pins the entire block to one page.
- **Verification step:** after rendering, extract text per page and confirm no section header is the last visible line of a page. If it is, the build fails QA and must be regenerated.

### Education & Certifications — Never Split
Entire section must stay on one page (header + degree + institution + every cert). If it doesn't fit, move the whole section to the next page or reduce certs. The section header must move with the content — never leave the header orphaned on the previous page.

### Projects
- 2-4 most relevant to JD. Order: newest to oldest.
- Bold title → 2-3 concise bullets → `Skills used: X, Y, Z` (comma-separated).
- No em dash anywhere.

### Skills Section — Dedicated, After Projects
- Comma-separated, grouped by category relevant to the JD:
  - **Programming:** Python, JavaScript, Java, Ruby, C#, ...
  - **Backend:** REST APIs, GraphQL, Node.js, Ruby on Rails, ...
  - **Cloud & DevOps:** AWS, Docker, CI/CD, Git, ...
  - **Healthcare:** HL7, FHIR, Epic EHR, Rhapsody, ...
  - **Security:** SIEM, EDR, WAF, ISO 27001, ...
- Use natural ATS variations where true: `Java, JDK` / `SQL, Microsoft SQL Server`.
- **ATS tip:** include both full name and common abbreviation where relevant (e.g., "Amazon Web Services (AWS)").

### Professional References
```
Professional References
Available upon request.
```
**Canada:** this line is acceptable.
**US:** omit entirely — considered outdated in the US market.

### Writing Tone
- Every bullet reads like a real professional wrote it. No AI-template patterns.
- Vary sentence length and openers. No two bullets start the same way in a row.
- Rewrite anything mechanical before finalizing.

### Years of Experience
- Read the `Max experience claim` cap from `MY_INFO.md → IDENTITY`. Never exceed it on any resume or cover letter, even for senior-level postings.
- Use less when JD or domain focus makes it more accurate (3+, 4+, etc.).

### Line Formatting
- Degree line, cert lines, company/date lines, Skills used lines must not wrap awkwardly.
- Never more than two lines per entry. Line 2 always starts with ` | `.

### Measurable Results
- Use real numbers, scale, users, systems, transactions, or time saved where known.
- Never invent metrics. Ask user or use a truthful non-numeric impact statement.

### Cover Letter
- Always build both PDF and DOCX.
- Header: Name → Title → Contact. No contact info at the bottom.
- **Company address:** search the web first. Ask only if multiple locations or no reliable address found.
- Structure: opening hook tied to company product/mission | specific proof from experience | second angle | close.
- Never use em dash anywhere.
- Canada: date above address in YYYY-MM-DD format. US: Month Day, Year format.

### Output
- All 5 files: resume PDF + DOCX, cover letter PDF + DOCX, WHY.md
- All inside `<output dir>/<YYYY-MM>/<Company>/Resume_[JobTitle]_[Company]/` (innermost folder gets `_V1`, `_V2`, etc. if it already exists). Save the raw JD text here too.
- ATS report unless Just Generate
- **Feedback prompt after every build** (see FEEDBACK section below)

---

## ATS SCORING BLOCK

After every build (unless Just Generate):

```
╔══════════════════════════════════════════════════════════════╗
║                     ATS ANALYSIS REPORT                      ║
╠══════════════════════════════════════════════════════════════╣
║  Role:      [Job Title]                                       ║
║  Company:   [Company Name]                                    ║
║  Market:    [Canada / United States]                          ║
╠══════════════════════════════════════════════════════════════╣
║                                                               ║
║  ATS SCORE    ████████████████░░░░  78%                      ║
║               (20 chars: 1 █ per 5%, remainder ░)            ║
║                                                               ║
╠══════════════════════════════════════════════════════════════╣
║  RISK LEVEL   🟢 Low (75%+)  🟡 Medium (50-74%)  🔴 High    ║
╠══════════════════════════════════════════════════════════════╣
║  ✅ MATCHED KEYWORDS                                          ║
║     keyword1 · keyword2 · keyword3 · keyword4                ║
║     keyword5 · keyword6                                       ║
╠══════════════════════════════════════════════════════════════╣
║  ❌ MISSING KEYWORDS                                          ║
║     keyword7 → suggested section: [Summary / Experience]     ║
║     keyword8 → suggested section: [Skills]                   ║
╠══════════════════════════════════════════════════════════════╣
║  💡 SUGGESTED FIXES  (max 3)                                  ║
║     1. [Specific, actionable fix]                            ║
║     2. [Specific, actionable fix]                            ║
║     3. [Specific, actionable fix]                            ║
╠══════════════════════════════════════════════════════════════╣
║  📋 RECOMMENDATION                                            ║
║     [1-2 honest sentences on resume strength vs this JD]     ║
╚══════════════════════════════════════════════════════════════╝
```

Score bar: 20 characters total, 1 █ per 5% (e.g., 80% = 16 █ + 4 ░).
Ask user which missing keywords to add — never auto-add.

---

## WHY.md — DECISION DOCUMENT

Generate `WHY_[JobTitle]_[Company].md` in the output folder after every build. If the folder was versioned (e.g., `_V2`), the WHY filename does not need a version suffix — it lives inside the versioned folder.

```markdown
# Resume Build Decisions
**Role:** [Job Title] at [Company]
**Built:** [Date]
**Market:** [Canada / United States]
**Style:** [Style name]
**Bullet mode:** [FullPoints / OnePoints]

---

## JD Analysis Summary
- **Target title:** ...
- **Required skills:** ...
- **Preferred / bonus skills:** ...
- **Seniority level:** ...
- **Domain keywords extracted:** ...
- **Language requirements:** [Yes — [language] / No]
- **Certifications mentioned:** [Yes — [cert] / No]

---

## Employers Included
| Employer | Included | Reason |
|---|---|---|
| [Employer] | Yes / No | [Reason from MY_INFO.md or JD match] |

---

## Certificates Included
| Certificate | Included | Reason |
|---|---|---|
| [Cert] | Yes / No | [JD mentions topic / Not relevant] |

---

## Projects Selected
| Project | Included | Reason |
|---|---|---|
| [Project] | Yes / No | [Matches JD requirement / Less relevant] |

---

## Content Decisions
- **Languages line:** [Included / Omitted — reason]
- **Skills lines per job:** [Yes / No — reason]
- **Primary language/framework highlighted:** [Name — where it appears]
- **References section:** [Included / Omitted — market rule]
- **Page fit:** [How 2 pages was achieved]

---

## How to Request Changes
- Replace a project: "Replace [X] with [Y]"
- Add a missing skill: "Add [skill] to the [section]"
- Change tone: "Make the [employer] bullets more [technical / leadership-focused]"
- Adjust length: "Tighten the [employer] section"
```

---

## FEEDBACK — After Every Build

After delivering the resume, QA report, and ATS score, always ask:

> "Before we close — was this resume better or worse than you expected? Any specific feedback on what worked well or what to improve? This helps me build better resumes for you over time. (You can skip this)"

If the user provides feedback, extract the lesson and append to `FEEDBACK.md`:

```markdown
# Resume Builder — Feedback Log

---

## [YYYY-MM-DD] — [Role] at [Company]

**Type:** Positive / Negative / Mixed
**What was said:** "[paraphrased or exact feedback]"
**Lesson:** [What to do differently or keep doing]
**Scope:** [All resumes / Healthcare resumes / DOCX / Cover letters / etc.]

---
```

At the start of every session, read `FEEDBACK.md` and apply relevant lessons before generating anything.

---

## FINAL QA REPORT

Return before delivering. Fix and regenerate if anything fails.

```
QA Report
──────────────────────────────────────────────────────
Resume PDF page count: 2 pages             [ PASS / FAIL ]
DOCX spacing compact (single, 0-2pt):      [ PASS / FAIL ]
Header rule absent (unless requested):     [ PASS / FAIL ]
Contact info in body (not header/footer):  [ PASS / FAIL ]
Employer blocks split:                     [ YES / NO    ]
Education & Certifications split:          [ YES / NO    ]
Section headers never orphan from content: [ PASS / FAIL ]
Certificates relevant to JD:              [ PASS / FAIL ]
Required JD technologies with evidence:    [ PASS / FAIL ]
Primary tech traceable in bullets:         [ PASS / FAIL / N/A ]
No em dashes in any file:                  [ PASS / FAIL ]
All 5 output files created:               [ PASS / FAIL ]
Section order correct:                     [ PASS / FAIL ]
Market rules applied (Canada/US):          [ PASS / FAIL ]
──────────────────────────────────────────────────────
```

---

## DOCX TECHNICAL RULES

- **Real Word bullets only.** Inject a numbering definition into `numbering.xml` and bind every bullet paragraph to it with `<w:numPr>` (numId + ilvl=0). The bullet glyph is rendered by Word from the numbering; the paragraph text must NOT start with `•`, `•\t`, or any inline bullet character. Inline-prefix bullets look AI-built — never ship them. Use `lvlText="•"`, Symbol font, `<w:ind w:left="360" w:hanging="220"/>`. Never mix native list bullets with manual `•` (causes double bullets). In PDF, use ReportLab's `Paragraph(text, style, bulletText="•")` with `leftIndent` / `bulletIndent` set on the style.
- **Single line spacing (1.0)** on all paragraphs. Never Word default 1.15 or 1.5.
- **No empty paragraphs.** Never insert `doc.add_paragraph()` for spacing. Use spaceAfter/spaceBefore only.
- **Spacing:** 0pt spaceBefore, 0-2pt spaceAfter on normal paragraphs. Bullets: 2pt spaceAfter.
- **Contact in body.** Never use Word's native header/footer for contact info — ATS cannot read it.
- **Page breaks.** Set `keep_with_next = True` on job title and company paragraphs to prevent employer block splitting.
- **Font consistency.** Every paragraph must explicitly set font name and size. Never rely on document defaults.
- **Cover letter DOCX.** Always generate. Never skip.

---

## POWER VOCABULARY

For opener variety and impact-phrase patterns, read `reference/POWER_VOCAB.md` while writing bullets. Quick rules to always apply: rotate openers (never repeat one in the same resume), and avoid "leveraged", "utilized", "in order to", em dashes, and semicolon separators.

---

## HOW TO UPDATE THIS SKILL

- Rules: `/update-rules` — the skill shows the proposed change and confirms before saving
- Personal data: `/update-info` — paste new data, the skill merges into MY_INFO.md
- New cert: `/add-cert` | New job: `/add-experience` | New project: `/add-project`
- New style: `/add-style`
- Manual edit: edit any file directly — keep the `---` YAML frontmatter at top intact

---

## ATS KEYWORD BANK

For domain keyword ideas during ATS scoring (Backend/SWE, Healthcare IT, Cloud/DevOps, Data, Security, Leadership), read `reference/ATS_KEYWORDS.md`. Always prefer the exact terms from the JD over any bank entry.
