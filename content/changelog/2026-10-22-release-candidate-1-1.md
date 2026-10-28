---
title: "Release Candidate 1.2"
version: "1.0.0-rc.2"
channel: rc
breaking: false
summary: "The release candidate for EuroKeep 1.0 – feature-complete and ready for testing before the stable release."
draft: false

changes:
  added:
   - "No additions"
  changed:
    - "No changes"
  fixed:
    - "EuroKeep Logo needs major change since it is too close to the official EU emblem."
    - "Important fixes for Security & Stability"
    - "Several UI / UX fixes"
  security:
    - "None"
---
This is a **pre-release** for testing. Please back up your data before upgrading and report any issues on [GitHub](https://github.com/EuroKeep).

This is the entire list of features and changes added to this version:

- EUR-81[epic] Improve Homescreen On Lacking Data
  - EUR-69[bugfix] No Accounts leads to senseless Homescreen (Empty Cards)
  - EUR-73[bugfix] No Piggybanks leads to senseless Homescreen (Empty Cards)
  - EUR-74[bugfix] No Budgets leads to senseless Homescreen (Empty Cards)
  - EUR-72[bugfix] No Subscriptions leads to senseles Homescreen (Empty Cards)
  - EUR-83[feature] Show Hint If No Accounts Exists
- EUR-80[bugfix] Backend Log Files On VS
- EUR-78[bugfix] Superfluous Nav Divider In Settings Dropdown
- EUR-84[bugfix] Subscriptions: Today's Subscriptions Not Displayed In Forecasts
- EUR-85[bugfix] Prevent SQL Injections in Search
- EUR-70[bugfix] Net Worth Metric Is Always EUR
- EUR-71[bugfix] The Subscription Metrics Are Always EUR
- EUR-90[bugfix] Select Boxes: Search Highlights Wrong Entries
- EUR-88[bugfix] Subscriptions: Box Overflow on Landscape Mobile
- EUR-82[bugfix] Evade Possible Law Issues With The Logo

This is a **pre-release** for testing. Please back up your data before upgrading and report any issues on [GitHub](https://github.com/EuroKeep).

## Upgrade

Set the image tag in your `compose.yaml` to `eurokeep/eurokeep:1.0.0-rc.1`, then pull the new image and restart the stack:

```sh
docker compose pull && docker compose up -d
```
