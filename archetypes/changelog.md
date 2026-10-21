---
# File name: content/changelog/YYYY-MM-DD-<slug>.md
#   → release date = YYYY-MM-DD, URL = /changelog/<slug>/  (no dots in <slug>, e.g. stable-release-1-0)
# Not published while draft: true or while the date lies in the future.
title: "Release title"
version: "0.0.0"             # semantic version, also used as Docker tag
channel: stable              # stable | beta | rc
breaking: false              # true = shows a "Breaking changes" badge
summary: "One sentence about this release (overview + meta description)."
draft: true

# Leave out or empty any category you don't need. Entries support Markdown.
changes:
  added:
    - ""
  changed:
    - ""
  deprecated: []
  removed: []
  fixed:
    - ""
  security: []
---

<!-- Optional: highlights, upgrade notes, screenshots – shown on the release page. -->
