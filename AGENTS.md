# AGENTS.md — Instructions for AI agents working on this repo

Any AI agent (Claude, Codex, or other) editing this repository **must** follow these rules.

## 1. Commit and push every change

After completing any change, **commit it and push it** — never leave work uncommitted.

```bash
git add -A
git commit -m "<clear, specific message>"
git push origin main
```

- One logical change per commit, with a message that says what changed and why.
- Do not batch unrelated changes into a single commit.
- End commit messages with a `Co-Authored-By:` trailer for the agent that made them.

## 2. Never hand-edit generated files

`claude/SKILL.md`, `codex/SKILL.md`, and both `RESUME_STYLES.md` are **generated**. Edit the source, then rebuild:

| To change | Edit | Then run |
|---|---|---|
| A shared rule | `shared/CORE.md` | `./build.sh` |
| A visual style | `shared/RESUME_STYLES.md` | `./build.sh` |
| Reference material (setup, keyword bank, power vocab) | `shared/reference/*.md` | `./build.sh` |
| Skill name/description | `shared/FRONTMATTER.md` | `./build.sh` |
| Platform-specific header | `claude/_platform.md` or `codex/_platform.md` | `./build.sh` |

**Always run `./build.sh` before committing** if you touched any source under `shared/` or a `_platform.md`. Then commit the regenerated artifacts together with the sources. CI/sanity: `./build.sh --check` exits non-zero if a committed artifact is stale.

## 3. Never commit personal data

`MY_INFO.md` and `FEEDBACK.md` are gitignored. Never add, force-add, or paste their contents into tracked files. The public templates are `*/MY_INFO.template.md`.

## 4. Keep the two versions in sync

The `claude/` and `codex/` versions must stay behaviorally identical except for platform plumbing (file resolution, invocation, output paths). Shared behavior lives in `shared/` — put it there, not in one platform's header.
