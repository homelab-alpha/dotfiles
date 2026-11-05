# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Add a brand guide and branding files in `.github/branding/` (logo, icons,
  favicon, and social preview), and show the logo at the top of `README.md`
- Add the `badges.yml` workflow and `.github/scripts/generate_badges.py` to render the
  README badges, including Super Linter and CodeQL, as SVG files on the `badges`
  branch

### Changed

- Move the repository tooling (`lint.sh`, `generate_badges.py`, `setup_gpg.sh`,
  and `verify_signatures.sh`) from `scripts/` to `.github/scripts/`, the
  branding from `assets/branding/` to `.github/branding/`, and the code style
  guide from `docs/` to `.github/docs/`
- Add a 20 px protective border to the logo SVGs and show the logo in
  `README.md` at a fixed height of 100 px
- Update the badges only after Lint Repository and CodeQL ran and passed for the
  same commit: remove the `push` trigger from `badges.yml` and add the
  `check-workflows` job
- Replace the `img.shields.io` badges in `README.md` with the self-hosted
  badges
- Explain in `.github/super_linter.env` when to enable PowerShell validation
- Explain in `codeql.yml` when to add a language
- Ignore `notes.md`, `super_linter.log`, and Python cache files in `.gitignore`
- Replace the deprecated `deny-licenses` option in `dependency_review.yml` with
  an `allow-licenses` list of permissive licenses and CC BY-NC-SA 4.0, so GPL
  and LGPL stay blocked
- Check development dependencies too in `dependency_review.yml`, by setting
  `fail-on-scopes` to `runtime, development`
- chore: adopt the blueprint template as the repository standard [5f21718](https://github.com/homelab-alpha/dotfiles/commit/5f217183293287b7ea0b4bea07fb9280a6be2d4a) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(deps): comment on the pull request only when the dependency review fails [fa150fe](https://github.com/homelab-alpha/dotfiles/commit/fa150fec541d7a55ef5aa044c8595f50dad48ceb) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: add CLAUDE.md with the project rules for Claude Code [5ded797](https://github.com/homelab-alpha/dotfiles/commit/5ded7970fae72b8cac8a7eabc8f89583f6f2896d) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(repo): adopt the current blueprint standard [5cc4f90](https://github.com/homelab-alpha/dotfiles/commit/5cc4f90057429997a303ad53ac45e77a4e4fb8bf) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(repo): sync the latest blueprint updates [96d50dc](https://github.com/homelab-alpha/dotfiles/commit/96d50dce232f64357fa5e4edf334a710eb30f1d1) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(workflows): replace deny-licenses with allow-licenses [0e0e9ad](https://github.com/homelab-alpha/dotfiles/commit/0e0e9ad5139c9cebadc9c6254fbcd5665196bba2) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(blueprint): sync with the blueprint [d063d7c](https://github.com/homelab-alpha/dotfiles/commit/d063d7c2a9811ba203d08408d69422d34eec2268) by [@homelab-alpha](https://github.com/homelab-alpha)

### Deprecated

### Removed

### Fixed

- Fix the link to the documentation site in `README.md`, which pointed to
  `homelab-alpha.nl/docs/dotfiles/` instead of `homelab-alpha.nl/dotfiles/`
- Fix the GitHub link in `NOTICE`, which pointed to `github.com/dotfiles`
  instead of `github.com/homelab-alpha`
- Fix the table of contents link of `CONTRIBUTING.md` to its first heading
- fix(renovate): fix invalid automergeType and vulnerability rule [680f92d](https://github.com/homelab-alpha/dotfiles/commit/680f92d02dfe687241a7ddc66854a26e3bb6b9a4) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(bash-script): sync install scripts with the shell-script repository [84456bb](https://github.com/homelab-alpha/dotfiles/commit/84456bb1dbf89d0e05ad0268bd618485a5d23739) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(labels): skip unchanged labels and retry failed writes [6e34546](https://github.com/homelab-alpha/dotfiles/commit/6e3454666e58c23fc84d4a294bbf7623e646fe41) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(docs): fix the TOC link to the first heading [6203c32](https://github.com/homelab-alpha/dotfiles/commit/6203c329b5ff179f6570ece6b2219a5c77e853e1) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(docs): fix the documentation site link [99001f7](https://github.com/homelab-alpha/dotfiles/commit/99001f7ce6771c19cf766418709af692561b2bd2) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(changelog): remove the date from Unreleased [8852779](https://github.com/homelab-alpha/dotfiles/commit/8852779582e3e80f062aa43ec0e648235d520c1b) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(changelog): remove the Unreleased link [642689e](https://github.com/homelab-alpha/dotfiles/commit/642689eed21c5382e8fbfac01e7c42241f3e8737) by [@homelab-alpha](https://github.com/homelab-alpha)

### Security

- Override the transitive dev dependencies `glob` (14.0.3) and `minimatch`
  (11.0.3) to fix Dependabot alerts, which textlint pulls in
