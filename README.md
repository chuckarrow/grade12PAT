# RyokoFuku — Grade 12 CAT PAT

A desktop trip-planning and shopping application built in **Delphi (Object Pascal)** for my Grade 12 Computer Applications Technology Practical Assessment Task (PAT).

RyokoFuku lets a user sign up, log in, browse a shop, add items to a trip, and manage that trip (inspect, edit, remove, finalise). Store and item management is handled through separate **Manager** and **Admin** roles, each with their own home screen.

## Features

- **Accounts** — sign up and log in, with validation (password match/strength, age, username checks) handled through dedicated `TUserSignup` / `TUserLogin` classes
- **Shop** — browse items with search, category filtering, and sorting; add items to an active trip
- **Trip Overview** — inspect, edit, remove, and finalise items in the current trip
- **Manager Home** — view and edit stores/items belonging to a manager
- **Admin Home** — view and manage all stores, items, and users across the system
- **Shared UI helpers** — a common data module handles window centring and other repeated VCL fixes

## Tech Stack

- **Language:** Object Pascal (Delphi)
- **Framework:** VCL (Visual Component Library)
- **Database:** Microsoft Access (`.mdb`) via ADO (`Microsoft.Jet.OLEDB.4.0`)
- **IDE:** Embarcadero Delphi / RAD Studio

## Project Structure

| File | Purpose |
|---|---|
| `ryokofuku_p.dpr` | Main program entry point — creates and runs all forms/data modules |
| `home_u` | Main menu / landing screen after login |
| `launch_welcome_u`, `launch_login_u`, `launch_signup_u` | Welcome, login, and signup screens |
| `shop_landing_u` | Shop browsing, searching, filtering, and adding items to a trip |
| `popup_addToTrip_u` | Popup for confirming quantity/comment when adding an item to a trip |
| `trip_overview_u` | View and manage the current trip |
| `manager_home_u` | Manager-facing store/item management |
| `admin_home_u` | Admin-facing store/item/user management |
| `debug_db_u` | Internal debug form used during development |
| `DMUnit` | Core data module — database connection and table/query components |
| `DMLoginSystem_u` | Login/signup logic and validation classes |
| `DMCommon_u` | Shared UI helper procedures (window centring, etc.) |
| `TODO.md` | Running task list and PAT requirement tracker |

## Status

This is an active school project and not all features are complete yet — see [`TODO.md`](./TODO.md) for the current task list and PAT requirement checklist.

## Sources / References

This project was written and coded by me. Where I got stuck, I made light use of AI (mainly for explaining error messages and unfamiliar Delphi behaviour) but relied primarily on:

- **Stack Overflow** — for troubleshooting specific Delphi/VCL issues (e.g. window activation behaviour in `DMCommon_u`, referenced in-code)
- **Delphi/Embarcadero documentation** — for VCL, ADO, and Object Pascal language reference
- **Class materials and guidance provided by my teacher** for this PAT

## Author

Charles Fletcher — Grade 12, South African College Schools (SACS)

(This README was made by Claude.ai)
