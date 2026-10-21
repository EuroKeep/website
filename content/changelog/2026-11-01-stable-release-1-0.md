---
title: "Stable Release 1.0"
version: "1.0.0"
channel: stable
breaking: false
summary: "The first stable release of EuroKeep – self-hosted budgeting on your own hardware."
draft: true

changes:
  added:
    - "Accounts for bank and cash, including IBANs and multiple currencies."
    - "Budgets per category with remaining amounts."
    - "Discreet mode that hides all amounts with one click."
  changed:
    - "Faster start page for large transaction histories."
  fixed:
    - "Transfers between accounts in different currencies are rounded correctly."
  security:
    - "Session cookies are now `HttpOnly` and `SameSite=Strict`."
---

## Upgrade

Pull the new image and restart the stack:

```sh
docker compose pull && docker compose up -d
```
