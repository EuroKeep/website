---
title: "Changelog"
eyebrow: "Releases"
lead: "All notable changes to EuroKeep, newest first."
# Not indexed until the first release – remove robots/sitemap then.
robots: "noindex, follow"
sitemap:
  disable: true
description: "Release notes and version history of EuroKeep, the self-hosted budgeting and money tracking app."
# One file per release in this folder, see archetypes/changelog.md for the format:
#   hugo new content changelog/2026-11-01-stable-release-1-0.md
# The date and URL come from the file name (YYYY-MM-DD-<slug>.md, no dots in <slug>).
# Releases with a future date or draft: true are not published.
# Jira tickets of a release: scripts/jira-changelog.py content/changelog/<file>.md
#   (needs JIRA_URL + JIRA_EMAIL/JIRA_API_TOKEN or JIRA_PAT, writes data/jira/<file>.json)
---

EuroKeep uses [semantic versioning](https://semver.org/). Docker images are tagged with the version number.
