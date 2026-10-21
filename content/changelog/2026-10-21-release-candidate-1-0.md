---
title: "Release Candidate 1.0"
version: "1.0.0-rc.1"
channel: rc
breaking: false
summary: "The release candidate for EuroKeep 1.0 – feature-complete and ready for testing before the stable release."
draft: false

changes:
  added:
    - "Management for Accounts, Categories, Account Types and Payment Methods."
    - "Management for Transactions, calculations for account balances, transfers between accounts"
    - "Management for Subscriptions, subscription widgets on home screen"
    - "Management for Piggy Banks, saving feature for adding money into a piggy bank."
    - "Budgeting: Manage budgets, monitor whether you exceeded them based on categories."
    - "Analysis tool: Check the largest and smallest transactions based on their category."
    - "Budgets per category with remaining amounts."
    - "Discreet mode that hides all sensitive info with one click."
  changed:
    - "No changes, it is the release candidate."
  fixed:
    - "None"
  security:
    - "None"
---

This is a **pre-release** for testing. Please back up your data before upgrading and report any issues on [GitHub](https://github.com/EuroKeep).

## Upgrade

Set the image tag in your `compose.yaml` to `eurokeep/eurokeep:1.0.0-rc.1`, then pull the new image and restart the stack:

```sh
docker compose pull && docker compose up -d
```
