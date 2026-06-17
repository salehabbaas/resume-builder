# AGENTS.md — Resume Builder (Codex version)

Project instructions for Codex / OpenAI agents using this skill.

## Skill

Invoke with `$resume-builder`. The full rules, commands, and workflow live in `SKILL.md` in this folder. Read it before any build.

## Paths (set these once, then keep them here)

Codex resolves files by absolute path. Fill in your machine's paths:

- `SKILL_DIR`: `/absolute/path/to/resume-builder/codex`  ← this folder (holds SKILL.md, MY_INFO.md, RESUME_STYLES.md, FEEDBACK.md)
- `RESUMES_DIR`: `/absolute/path/to/your/Resumes`  ← where generated `Resume_[JobTitle]_[Company]/` folders are written

## Before first build

1. Copy `MY_INFO.template.md` to `MY_INFO.md` and fill in your data.
2. `MY_INFO.md` and `FEEDBACK.md` are gitignored — never commit them.

## Session start

Read `MY_INFO.md`, `RESUME_STYLES.md`, and `FEEDBACK.md` (if present) before generating anything. Write all output under `RESUMES_DIR`, never into `SKILL_DIR`.
