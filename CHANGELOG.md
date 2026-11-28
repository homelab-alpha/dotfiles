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
- feat(github): add accessibility checks [f350d18](https://github.com/homelab-alpha/dotfiles/commit/f350d1824307097ae0f21503eb86439d0381796d) by [@homelab-alpha](https://github.com/homelab-alpha)
- feat(scripts): support NO_COLOR [603e17c](https://github.com/homelab-alpha/dotfiles/commit/603e17c5ffcdd887fcb82638a83e9f11ef2e3080) by [@homelab-alpha](https://github.com/homelab-alpha)

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
- ci(workflows): request a reviewer on bot PRs [00bc580](https://github.com/homelab-alpha/dotfiles/commit/00bc58047b1ef4d4e2419b71ab2bc05709dcd61e) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(github): sync Hugo and Dart Sass rules [db0c65b](https://github.com/homelab-alpha/dotfiles/commit/db0c65b144395f9581e6909aed027e4612157082) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(github): sync runners, Renovate, and linters [12cb7c6](https://github.com/homelab-alpha/dotfiles/commit/12cb7c6a2d2463fc21f43f71faebd176793c3691) by [@homelab-alpha](https://github.com/homelab-alpha)
- ci(workflows): run workflows for bots [f2d8543](https://github.com/homelab-alpha/dotfiles/commit/f2d8543607d72946ff5307ada992b03925d17327) by [@homelab-alpha](https://github.com/homelab-alpha)
- ci(workflows): allow BlueOak-1.0.0 license [a6b55f1](https://github.com/homelab-alpha/dotfiles/commit/a6b55f1248866c9cf3e2a1e773d4cbe16c9f76d8) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(labels): add dependency update labels [041ee8f](https://github.com/homelab-alpha/dotfiles/commit/041ee8fda8bb01c8d039e774c5ba036c48c996e5) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(renovate): remove default assignees [19298e1](https://github.com/homelab-alpha/dotfiles/commit/19298e11f3d2e6b1ec726ce2c360734629e524cc) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(renovate): group and automerge updates [80a751d](https://github.com/homelab-alpha/dotfiles/commit/80a751dd0241a88f57b46c990fec5123e7fd7723) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(sync): sync shared files with blueprint [ec626d3](https://github.com/homelab-alpha/dotfiles/commit/ec626d3fef33b4faf179362bd2510730f370950a) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: move and update AI contribution policy [d92c35e](https://github.com/homelab-alpha/dotfiles/commit/d92c35e10f0b34821d83546f845d3476f2d59c8f) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore: sync files with the blueprint [052e7a1](https://github.com/homelab-alpha/dotfiles/commit/052e7a1906ddb5467b6c59371cb09c7b6bf2e818) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(workflows): allow the PSF-2.0 license [8b89434](https://github.com/homelab-alpha/dotfiles/commit/8b89434f65802b11dd39cb63a934c63319bfb459) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(workflows): allow more MIT-like licenses [c9f4640](https://github.com/homelab-alpha/dotfiles/commit/c9f46403f29557baf95d223a7d6ca82e12cfc512) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(renovate): group npm updates in one pr [838f24c](https://github.com/homelab-alpha/dotfiles/commit/838f24cf80fd17bbf356ee47cf22a25808eb7c8e) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(renovate): group docker compose images [b2d852e](https://github.com/homelab-alpha/dotfiles/commit/b2d852e3cd4039cd4360c77b1520f788309bd2ec) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(labels): add renovate dependency labels [017bc99](https://github.com/homelab-alpha/dotfiles/commit/017bc9915740e59fabdf2158a6c8605ced282a0e) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: add conventional commits cheatsheet [4154bbc](https://github.com/homelab-alpha/dotfiles/commit/4154bbc32dc20fc36382692a8d9aeb24bee9548c) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs(readme): add values to badge alt text [7622d65](https://github.com/homelab-alpha/dotfiles/commit/7622d65914452083233a84157e8feed82962bb9f) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: add accessibility statement [7ec0fbe](https://github.com/homelab-alpha/dotfiles/commit/7ec0fbefcfa08318987412cf282a4b6141990dec) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: link the accessibility statement [8487937](https://github.com/homelab-alpha/dotfiles/commit/8487937d3c7fc1b6a025b31c28dff8afffdffdf5) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: document NO_COLOR support [84e13ed](https://github.com/homelab-alpha/dotfiles/commit/84e13ed23801a64d4031b7852d3fc1718275c876) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs: update the accessibility statement [68ccfc0](https://github.com/homelab-alpha/dotfiles/commit/68ccfc09be08ab2c764221dbfd2cfc2cc11fb068) by [@homelab-alpha](https://github.com/homelab-alpha)
- chore(renovate): ignore bot and owner commits [19b7d68](https://github.com/homelab-alpha/dotfiles/commit/19b7d6857d8d91977063d066487675b9c2c9267a) by [@homelab-alpha](https://github.com/homelab-alpha)
- ci(release): tag version commit, fix mentions [d9ba6f5](https://github.com/homelab-alpha/dotfiles/commit/d9ba6f5b42d2bf3f8ba1590e428d36fed751b5fe) by [@homelab-alpha](https://github.com/homelab-alpha)
- docs(policy): fix timeout-minutes indentation [c1914ed](https://github.com/homelab-alpha/dotfiles/commit/c1914ed9daa4ba577f9f21682193dbe011fb2ba7) by [@homelab-alpha](https://github.com/homelab-alpha)

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
- fix(workflow): do not draft Renovate PRs [eed3611](https://github.com/homelab-alpha/dotfiles/commit/eed3611422970877e283116fbf47a5b5d233ec71) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(renovate): remove invalid security rule that disabled grouping [d1e4ad7](https://github.com/homelab-alpha/dotfiles/commit/d1e4ad7caa94f671d9a140e38b14980e894e9018) by [@homelab-alpha](https://github.com/homelab-alpha)
- fix(renovate): label all updates in a group [c9d2744](https://github.com/homelab-alpha/dotfiles/commit/c9d27440e640014db7b1a16d9b2a0592c23a7080) by [@homelab-alpha](https://github.com/homelab-alpha)

### Security

- Override the transitive dev dependencies `glob` (14.0.3) and `minimatch`
  (11.0.3) to fix Dependabot alerts, which textlint pulls in
