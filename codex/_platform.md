# Resume Builder

An advanced AI resume-building skill for **Codex / OpenAI agents**. Drop in your data via `MY_INFO.md`, paste a job description, and get a fully tailored, ATS-scored, two-page resume with cover letter in both PDF and DOCX, built to pass modern ATS systems in Canada and the US.

> **Claude (Claude Code / Cowork) user?** Use the `claude/` version of this skill instead — it uses Claude's native skill file resolution. This `codex/` version carries the absolute-path portability rules Codex needs.

## CODEX PORTABILITY

Invoke this skill with `$resume-builder` from any Codex workspace. Treat commands listed below, such as `/resume`, as task intents after the skill has been invoked; they are not required to be installed as Codex slash commands.

Codex resolves files by absolute path, not relative to the working directory. **On first use, set these two paths** (store them in `MY_INFO.md` or your project's `AGENTS.md` so they persist):
- `SKILL_DIR`: the absolute path to this `codex/` folder, e.g. `/path/to/resume-builder/codex`. Holds `MY_INFO.md`, `RESUME_STYLES.md`, `FEEDBACK.md`.
- `RESUMES_DIR`: the absolute path to the folder where generated resumes should be written, e.g. `/path/to/your/Resumes`.

Then, every session:
- Read and update `SKILL_DIR/MY_INFO.md`, `SKILL_DIR/RESUME_STYLES.md`, and `SKILL_DIR/FEEDBACK.md` when applicable.
- Write generated output under `RESUMES_DIR`, always nested by month then company: `RESUMES_DIR/<YYYY-MM>/<Company>/Resume_[JobTitle]_[Company]/` (see Identity & Files → Output path for the full rule), including when Codex is launched from another project. Never write output into `SKILL_DIR`.

Copy `MY_INFO.template.md` to `MY_INFO.md` and fill it in before the first build. `MY_INFO.md` and `FEEDBACK.md` are gitignored and never committed.

If the current Codex surface provides interactive controls, use them for setup choices. Otherwise ask the same questions concisely in chat and continue from the answers.

At the start of every session read:
- `MY_INFO.md` — personal data: identity, experience, certificates, projects
- `RESUME_STYLES.md` — 6 visual styles with fonts, colors, layout specs
- `FEEDBACK.md` — past lessons from previous builds (if it exists)
