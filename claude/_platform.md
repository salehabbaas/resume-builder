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
