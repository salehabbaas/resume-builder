---
name: resume-my-info
description: Personal data file for resume building. Contains identity, all work experience (raw facts), certificates, projects, and education. Load alongside SKILL.md and RESUME_STYLES.md before building any resume.
---

# My Info — [Your Name]

> This file holds YOUR data. SKILL.md holds the rules. RESUME_STYLES.md holds the design.
> Copy this file to `MY_INFO.md` (gitignored) and fill in your own data.
> Keep the YAML frontmatter (--- block) at the top intact.

---

## IDENTITY

- **Full Name:** [Your Full Name — exactly as it should appear on the resume header]
- **Phone:** [Your Phone]
- **Email:** [Your Email]
- **LinkedIn:** linkedin.com/in/[yourhandle]
- **GitHub:** github.com/[yourhandle]
- **Location:** [Your City, Province/State, Country]
- **Resume city rule:** [Optional — e.g. "Always match the JD's city in the contact header." Omit this line to always use your home Location above.]
- **Max experience claim:** [Optional — e.g. "5+ years (hard cap)". The skill never claims more than this in any Summary or cover letter. Omit for no cap.]
- **Output directory:** [Optional — absolute path where generated resume folders should be written. Output is nested as <dir>/<YYYY-MM>/<Company>/Resume_.../ . If omitted, a `resumes/` folder in the current workspace is used.]
- **Languages:** [e.g. English (Native) | French (Conversational)]

### Identity selection (name + email per company) — optional
[Optional. Use different name/email depending on the JD's company. Delete this block to always use Full Name + Email above.]

| Match | Name | Email |
|---|---|---|
| **Apple** | [Name to use for Apple] | [email-for-apple@example.com] |
| **Default** (all other companies) | [Your Name] | [your-default@example.com] |

---

## EDUCATION

**[Degree Title]**
[Institution], [City]
[Start Year] - [End Year]

---

## CERTIFICATES

- [Certificate Name] | [Issuer] | [Month Year]
- ...

---

## WORK EXPERIENCE

### Job 1 — [Company Name]
**Display title on resume:** [Job Title shown on the resume]
**Display title note:** [Optional — e.g. "Use exactly — do not change"]
**Dates:** [Mon Year] - [Mon Year]
**Location:** [City, Country]
**Always include:** Yes / No
**Include when:** [Always, or the JD conditions that should trigger including this job]

**Raw facts (reframe emphasis only — never alter or fabricate):**
- [Fact 1 — what you built, what happened, real numbers]
- [Fact 2]
- ...

**Key tools:** [Tool1] | [Tool2] | [Tool3]

### Job 2 — [Company Name]
...

---

## PROJECTS

Select 2-4 most relevant per resume.

| Project | Best for |
|---|---|
| [Project Name] | [Role type, technologies] |
| ... | ... |
