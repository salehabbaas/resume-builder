# Resume Builder Skills

A portable resume-building skill pack created by **Saleh Abbaas** for generating targeted, ATS-aware resumes and cover letters from structured career data, job descriptions, and reusable design rules.

This repository is designed to be public-safe. The private profile file, `Resume_builder/skills/MY_INFO.md`, is intentionally ignored by Git. Use the included template to create your own local copy.

## What This Project Does

The skill pack gives an AI assistant a complete workflow for resume work:

- Build tailored resumes from a pasted job description.
- Generate matching cover letters.
- Keep output consistent across PDF and DOCX formats.
- Apply reusable resume styles and layout rules.
- Score resumes against ATS keywords from the job description.
- Maintain personal resume facts separately from formatting and workflow rules.

## Repository Structure

```text
Resume_builder/
├── RESUME_SKILLS.md
└── skills/
    ├── MY_INFO.template.md
    ├── MY_INFO.md          # local only, ignored by Git
    └── RESUME_STYLES.md
```

## Core Files

`Resume_builder/RESUME_SKILLS.md`

The master skill file. Load this first. It contains the commands, resume rules, ATS workflow, section ordering, formatting rules, file naming rules, and instructions for updating the skill.

`Resume_builder/skills/RESUME_STYLES.md`

The design reference. It defines reusable resume styles, colors, fonts, page layout rules, bullet styles, PDF implementation notes, and DOCX formatting guidance.

`Resume_builder/skills/MY_INFO.template.md`

The public-safe structure for personal data. Copy this file to `MY_INFO.md` and fill it locally with identity, education, certificates, experience, projects, skills, and targeting notes.

`Resume_builder/skills/MY_INFO.md`

Your private local profile. This file is ignored by Git and should not be uploaded to GitHub.

## Setup

1. Clone or download this repository.
2. Copy the public template:

```bash
cp Resume_builder/skills/MY_INFO.template.md Resume_builder/skills/MY_INFO.md
```

3. Fill `Resume_builder/skills/MY_INFO.md` with your real resume data.
4. Keep `MY_INFO.md` private. The `.gitignore` file already excludes it.

## How To Use

Start a resume session by loading these files in order:

1. `Resume_builder/RESUME_SKILLS.md`
2. `Resume_builder/skills/MY_INFO.md`
3. `Resume_builder/skills/RESUME_STYLES.md`

Then paste the full job description and run the workflow described in `RESUME_SKILLS.md`.

The assistant should ask for role title, style, font, highlighted projects, certificates, and any additional emphasis before building the resume.

## Main Commands

| Command | Purpose |
|---|---|
| `/resume` | Build a tailored resume and cover letter from a job description. |
| `/resume --style=<name>` | Build with a specific style. |
| `/update-resume` | Update an existing resume. |
| `/cover-letter` | Generate a matching cover letter. |
| `/ats-check` | Compare a resume against a job description for keyword coverage. |
| `/add-experience` | Add a new job to the private profile file. |
| `/add-cert` | Add a certificate to the private profile file. |
| `/add-project` | Add a project to the private profile file. |
| `/add-style` | Add a new style to the style reference. |
| `/show-styles` | List available resume styles. |

## How It Works

The workflow separates resume generation into three layers:

1. **Rules:** `RESUME_SKILLS.md` defines what the assistant must do.
2. **Private data:** `MY_INFO.md` stores the user's facts and stays local.
3. **Design:** `RESUME_STYLES.md` defines visual styles and layout constraints.

This separation makes the skill reusable. The public repo can improve the skill logic and styles without exposing private resume history, contact details, or job-specific exports.

## Privacy Model

This repository intentionally ignores:

- `old/`
- `*.zip`
- generated resume folders
- `Resume_builder/skills/MY_INFO.md`
- macOS `.DS_Store` files

Only the public-safe template is committed. Before pushing changes, verify with:

```bash
git status --short --ignored
```

## Builder

Built by **Saleh Abbaas**.

- GitHub: [github.com/salehabbaas](https://github.com/salehabbaas)
- LinkedIn: [linkedin.com/in/salehabbaas](https://www.linkedin.com/in/salehabbaas)

## License

No license has been added yet. Add a license before encouraging external reuse or contributions.
