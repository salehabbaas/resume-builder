---
name: resume-builder
description: Master resume-building skill. Orchestrates all rules, commands, and workflows. Always load this file first, then load skills/MY_INFO.md (private local profile data) and skills/RESUME_STYLES.md (design styles). Together these three files contain everything needed to build, update, or analyze any resume.
type: user
---

# Resume Builder — Master Skill

> **How to start every session:**
> 1. Upload / reference this file: `RESUME_SKILLS.md`
> 2. Upload / reference: `skills/MY_INFO.md`
> 3. Upload / reference: `skills/RESUME_STYLES.md`
> 4. Paste the job description (or use `/resume` to be prompted)
>
> All three files must be loaded. `MY_INFO.md` has private local profile data. `RESUME_STYLES.md` has the design specs.
> Rules in this file override everything else.
>
> Public repository note: `skills/MY_INFO.md` is intentionally ignored by Git. Copy `skills/MY_INFO.template.md` to `skills/MY_INFO.md` and fill it locally before using the skill.

---

## FILE MAP

```
Resumes/
├── RESUME_SKILLS.md          ← Load first. Rules, commands, workflows.
├── skills/
│   ├── MY_INFO.template.md   ← Public-safe structure for private profile data.
│   ├── MY_INFO.md            ← Load second. Local-only personal data, experience, certs, projects.
│   └── RESUME_STYLES.md      ← Load third. All styles, fonts, colors, layout specs.
└── Resume_[Title]_[Company]/
    ├── Resume_SalehAbbaas_[Title]_[Company].pdf
    ├── Resume_SalehAbbaas_[Title]_[Company].docx
    ├── CoverLetter_SalehAbbaas_[Title]_[Company].pdf
    └── CoverLetter_SalehAbbaas_[Title]_[Company].docx
```

---

## COMMANDS

| Command | What it does |
|---|---|
| `/resume` | Full resume build. Asks for JD if not provided, then asks customization questions, then builds PDF + DOCX + cover letter in a named folder. |
| `/resume --style=<name>` | Build with a specific style (elegant \| navy \| teal \| executive \| purple \| mono). Default is elegant. |
| `/update-resume` | Update an existing resume. Claude asks: which file? what to change? Then rebuilds. |
| `/cover-letter` | Build a cover letter for the last resume or a specified role. Same style as the resume. |
| `/ats-check` | Run ATS keyword analysis between a JD and a resume. Reports score % + matched keywords + missing keywords. |
| `/add-experience` | Add or update a job in MY_INFO.md. Claude asks for the raw facts, dates, location, tools. |
| `/add-cert` | Add a new certificate to MY_INFO.md. Claude asks for name, issuer, date. |
| `/add-style` | Add a new resume style to RESUME_STYLES.md. Claude asks for colors, layout, fonts. |
| `/add-project` | Add a new project to MY_INFO.md. Claude asks for title, description, tools, best-for roles. |
| `/update-info` | Update any section of MY_INFO.md. Paste the new data and Claude merges it. |
| `/update-rules` | Update any rule in this file. Claude asks what to change and confirms before saving. |
| `/rebuild-all` | Rebuild all 4 base resumes (SWE \| Cloud Architect \| Cybersecurity \| Software Developer) with latest rules and styles. |
| `/show-styles` | List all available styles with a one-line description of each. |
| `/show-certs` | List all certificates with their selection rules. |
| `/show-projects` | List all projects with their best-for roles. |

---

## BEFORE BUILDING

**If no JD is provided**, reply:
> "Please paste the full job description so I can tailor the resume and maximize your ATS score."

**After receiving the JD**, always run these customization questions before building:

> "Got it! A few quick questions before I build:
> 1. **Job title** — use the exact title from the JD, or do you want to adjust it?
> 2. **Style** — Minimal Elegant (default), or a different style? (`/show-styles` to see options)
> 3. **Font** — Calibri (default) or Arial?
> 4. **Projects** — any to highlight or exclude?
> 5. **Certificates** — any to include or exclude?
> 6. **Anything else** to add, change, or emphasize?"

---

## CORE RULES (ALWAYS FOLLOW)

### Identity & Naming
- Name on resume: `Saleh Abbaas` — first letter capitalized only. Never ALL CAPS.
- File name: `Resume_SalehAbbaas_[JobTitle]_[Company].pdf` / `.docx`
- Output folder: `Resume_[JobTitle]_[Company]/` inside the Resumes folder

### Location — CRITICAL
- **Never write "Palestine" or "West Bank" anywhere on the resume.**
- Use `Ramallah` only for Unipal and Arab Hospitals Group.
- Use `Ottawa, Ontario, Canada` for TOH.
- If unsure about any location, ask before writing.

### Page & Layout
- Exactly **2 pages**. No more, no less.
- **Page breaks:** Never split one employer's block across pages. If 3 jobs: 2 on page 1, 1 on page 2.
- **Section order:** Summary → Experience → Education & Certifications → Projects
- Default style: **Minimal Elegant** (see RESUME_STYLES.md)
- Default font: **Calibri** (DOCX) / **Helvetica** (PDF). Use Arial when user requests.

### Separators
- Use `|` everywhere — skills lists, contact line, cert lines, project lines.
- **Never use:** `—` (em dash) | `;` (semicolon) | `-` (hyphen) as separators. These signal AI writing.
- Date ranges only: use short hyphen `Dec 2024 - Sep 2025`

### Section Formatting
**Summary:** Always 5 bullet points. Use this structure (tailor each to JD):
```
• [Role] with [X]+ years of experience [core domain strength].
• Bachelor's Degree in Management Information Systems | [top cert for this JD].
• English (Professional Working Proficiency) | Arabic (Fluent) | French (Basics).
• Proficient in [JD top tech stack].
• Strong background in [second angle — pick what JD emphasizes].
```

**Experience bullets:** Rotate strong openers — never start every bullet with "Used".
See POWER VOCABULARY below. Every bullet must convey: tool/method + action + impact/reason.
Always include real numbers and percentages. If unknown, ask before guessing.

**Skills line per job:** `Skills: X | Y | Z` — bold "Skills:" label, pipe separators.

**Certificates:** Bullet list, one per line. Pick 3-5 most relevant per role. Never run in a single line.

**Projects:** Bullet list, one per line with bold title. Pick 2-4 most relevant per role.

### Job Titles on Resume
- The Ottawa Hospital → `Programmer Analyst` (keep exact — formal contract title)
- Arab Hospitals Group → `Software Engineer`
- World Health Organization → `Software Engineer`
- Unipal → `Cyber Security Engineer` (only include when JD mentions security)

### Experience Rules
- Always include: TOH + Arab Hospitals Group + WHO
- Include Unipal only when JD mentions security or compliance
- TOH: never focus heavily on security — only briefly mention HIPAA/PHIPA if the JD asks for it
- Deprecated (Next Generation Network, Hadara): only include if JD closely matches mobile dev, ops, or telecom
- Never fabricate or significantly alter TOH bullets — reframe emphasis only, never invent facts
- Experience always most-recent first: TOH → AHG → Unipal (if relevant) → WHO

### Output
- Always produce both **PDF** (ReportLab) and **DOCX** (python-docx)
- Always create a **cover letter** in the same style and place it in the same folder
- Always run an **ATS score** after building and report it to the user

---

## POWER VOCABULARY

### Strong openers — rotate these, never repeat the same opener twice in one resume
Architected | Engineered | Delivered | Spearheaded | Overhauled | Accelerated | Streamlined
Designed | Implemented | Launched | Optimized | Automated | Reduced | Eliminated | Scaled
Standardized | Integrated | Deployed | Established | Drove | Built | Developed | Migrated
Modernized | Transformed | Enabled | Secured | Orchestrated | Championed | Consolidated
Produced | Constructed | Rolled out | Shipped | Authored | Diagnosed | Resolved | Owned

### Impact phrases — add to bullets
- "...cutting [X] by [Y]%"
- "...handling [X]+ daily transactions"
- "...serving [X]+ users across [Y] countries"
- "...reducing downtime by [X]%"
- "...connecting [X] hospitals/systems"
- "...achieving [X]% accuracy"
- "...eliminating manual [process]"
- "...enabling [team/users] to [outcome]"
- "...across [X] healthcare organizations"

### Avoid
- Starting every bullet with "Used"
- "leveraged" or "utilized" (overused/robotic)
- "in order to" (use "to")
- Em dashes or semicolons as separators
- Repetitive sentence structure

---

## ATS SCORING

After every resume build, run this check and report:

1. Extract all required + preferred keywords from the JD
2. Check which appear in the resume (summary + bullets + skills lines + projects)
3. Score: `(matched / total) × 100 = ATS %`
4. Report:
```
ATS Score: XX%
✅ Matched: keyword1 | keyword2 | keyword3 ...
⚠️  Missing: keyword4 | keyword5 — suggested fix: add to [section]
```

---

## HOW TO UPDATE THIS SKILL

**To update rules (this file):**
Use `/update-rules` and describe what to change. Claude will show you the proposed edit and ask for confirmation before saving.

**To update your personal data:**
Use `/update-info` and paste the new info. Claude will identify which section of MY_INFO.md to update and merge it in.

**To add a new certificate:**
Use `/add-cert` — Claude will ask: name | issuer | date | priority (main/supporting).

**To add a new job or project:**
Use `/add-experience` or `/add-project` — Claude will ask for all details and add to MY_INFO.md.

**To add a new resume style:**
Use `/add-style` — Claude will ask for colors | layout | fonts | when to use, then add to RESUME_STYLES.md.

**Manual editing:**
You can edit any of the three files directly. The YAML frontmatter at the top of each file must stay intact (the `---` block).

---

## ATS KEYWORD BANK

Use these to fill gaps when a JD uses generic terms. Always prefer exact JD wording first.

**Backend / SWE:**
REST API | microservices | backend development | system design | scalable systems | distributed systems | CI/CD | version control | Git | code review | clean code | test-driven development | automated testing | GraphQL | API design | high availability | performance optimization | software delivery | release management

**Healthcare IT:**
HL7 | FHIR | Epic EHR | Rhapsody | Mirth Connect | DICOM | PACS | HIPAA | PHIPA | clinical data exchange | health informatics | healthcare integration | interoperability | EHR integration | clinical workflows | patient data | health records

**Cloud / DevOps:**
AWS | Docker | Kubernetes | cloud-native | infrastructure | deployment pipeline | CI/CD | containerization | cloud architecture | auto-scaling | IaC | cloud services | cloud platform

**Data:**
ETL | data pipelines | SQL | PostgreSQL | MySQL | Oracle | SQL Server | Elasticsearch | Power BI | Pandas | Python | data engineering | real-time analytics | data platform | reporting | dashboards | data integration

**Security:**
ISO 27001 | CEH | EDR | SIEM | WAF | incident response | penetration testing | vulnerability management | zero trust | network segmentation | endpoint security | compliance | risk management | security operations

**Leadership / Soft:**
code review | mentorship | technical documentation | cross-functional collaboration | stakeholder communication | agile | Jira | solution design | release strategy | technical leadership | engineering culture | mentoring | knowledge sharing
