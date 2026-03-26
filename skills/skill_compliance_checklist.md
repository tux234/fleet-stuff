# Skill Compliance Checklist

Tracks conformance of all skills against the Anthropic Claude Code skills format specification.

## Format Specification (Anthropic)

### Three-Tier Progressive Disclosure

| Tier | What | Loaded When | Constraint |
|------|------|-------------|------------|
| **1. Frontmatter** | YAML `description:` at top of SKILL.md | Always (auto-loaded) | 15,000 chars total across ALL skills |
| **2. SKILL.md Body** | Step-by-step SOP, "table of contents" | When skill triggers | < 200 lines (500 max) |
| **3. References** | Deep docs, templates, schemas | On-demand per step | < 200–300 lines each |

### Required Structure

```
skill-name/
├── SKILL.md              # Required — with YAML frontmatter
├── learnings.md          # Recommended — feedback/rules file
├── references/           # Optional — deep docs, templates, examples
├── scripts/              # Optional — executable code (bash, python)
└── assets/               # Optional — non-text files (icons, fonts, PDFs)
```

### Rules
- Empty optional directories should NOT exist (remove them)
- SKILL.md must start with `---` YAML frontmatter containing `description:`
- `description:` must be concise (< 100 chars recommended)
- SKILL.md body acts as a "table of contents" — points to references, doesn't duplicate them
- Reference files should be self-contained and loadable independently
- `learnings.md` captures rules (hard constraints) and observations (soft learnings) from real sessions

---

## Compliance Matrix

### fleet-api

| Criterion | Status | Detail |
|-----------|--------|--------|
| YAML frontmatter | ✅ | `description:` present, 90 chars |
| SKILL.md line count | ✅ | 104 lines (< 200) |
| Progressive disclosure | ✅ | Step 3 loads references on-demand via table |
| Reference files < 300 lines | ⚠️ | endpoint-index.md = 330 lines (lookup table, acceptable) |
| learnings.md present | ✅ | 74 lines, 6 rules + 3 observations |
| scripts/ (if present) has content | ✅ | 2 scripts (update-endpoint-index.sh, validate-endpoints.sh) |
| assets/ (if present) has content | ✅ | Not present (removed empty) |
| No empty directories | ✅ | Clean |

### fleet-gitops

| Criterion | Status | Detail |
|-----------|--------|--------|
| YAML frontmatter | ✅ | `description:` present, 93 chars |
| SKILL.md line count | ✅ | 107 lines (< 200) |
| Progressive disclosure | ✅ | Step 3 loads references on-demand via table |
| Reference files < 300 lines | ✅ | yaml-schema.md = 284 lines (largest) |
| learnings.md present | ✅ | 176 lines, 21 rules + 5 observations |
| scripts/ (if present) has content | ✅ | Not present (removed empty) |
| assets/ (if present) has content | ✅ | Not present (removed empty) |
| No empty directories | ✅ | Clean |
| Templates in references/templates/ | ✅ | 8 standalone YAML/JSON templates |

### mobileconfig-profile

| Criterion | Status | Detail |
|-----------|--------|--------|
| YAML frontmatter | ✅ | `description:` present, 89 chars |
| SKILL.md line count | ✅ | 90 lines (< 200) |
| Progressive disclosure | ✅ | Step 3 loads references on-demand via table |
| Reference files < 300 lines | ✅ | apple-schema-com.apple.systempreferences.yaml = 141 lines (largest) |
| learnings.md present | ✅ | 67 lines |
| scripts/ (if present) has content | ✅ | 1 script (validate-profile.sh) |
| assets/ (if present) has content | ✅ | Not present (removed empty) |
| No empty directories | ✅ | Clean |

---

## Global Constraints

| Metric | Value | Limit | Status |
|--------|-------|-------|--------|
| Total skills | 3 | — | — |
| Combined frontmatter description chars | ~272 | 15,000 | ✅ |
| Largest SKILL.md | 107 lines (fleet-gitops) | 200 | ✅ |
| Largest reference file | 330 lines (endpoint-index.md) | 300 | ⚠️ |
| Total reference files | 16 | — | — |
| Total template files | 9 | — | — |
| Total scripts | 3 | — | — |

---

## Inventory

### fleet-api (4 files)
- `SKILL.md` — 104 lines
- `learnings.md` — 74 lines
- `references/endpoint-index.md` — 330 lines
- `scripts/update-endpoint-index.sh` — 92 lines
- `scripts/validate-endpoints.sh` — 67 lines

### fleet-gitops (16 files)
- `SKILL.md` — 107 lines
- `learnings.md` — 176 lines
- `references/certificate-authorities.md` — 88 lines
- `references/file-structure-template.md` — 242 lines
- `references/fleet-variables.md` — 44 lines
- `references/scope-rules.md` — 84 lines
- `references/yaml-schema.md` — 284 lines
- `references/templates/agent-options.yml` — 22 lines
- `references/templates/ddm-declaration.json` — 8 lines
- `references/templates/default.yml` — 34 lines
- `references/templates/fleet.yml` — 61 lines
- `references/templates/label.yml` — 26 lines
- `references/templates/policy.yml` — 25 lines
- `references/templates/report.yml` — 16 lines
- `references/templates/software-package.yml` — 32 lines
- `references/templates/unassigned.yml` — 31 lines

### mobileconfig-profile (8 files)
- `SKILL.md` — 90 lines
- `learnings.md` — 67 lines
- `references/apple-schema-com.apple.systempreferences.yaml` — 141 lines
- `references/apple-schema-common-payload-keys.yaml` — 60 lines
- `references/apple-schema-toplevel.yaml` — 105 lines
- `references/common-payload-types.md` — 128 lines
- `references/template.mobileconfig` — 78 lines
- `references/validation-checklist.md` — 59 lines
- `scripts/validate-profile.sh` — 57 lines

---

## Last Checked

**2026-03-26T12:00:00Z**

---

## Changelog

| Date | Change | Author |
|------|--------|--------|
| 2026-03-26 | Initial setup. Created 3 skills (fleet-api, fleet-gitops, mobileconfig-profile). Added YAML frontmatter to all SKILL.md files. Removed empty optional directories. Created eval framework. Built 8 standalone GitOps YAML templates. Populated learnings.md for all skills from Fleet v4.82 CHANGELOG. Updated file-structure-template.md to use new `platforms/` + `labels/` + `fleets/` layout. | henry stamerjohann + claude code |
