# TODO

## Things to Ask Ma'am
1. TLabel not a class?
1. Do we need table connections in `DMUnit` at all, if just using SQL?
1. Fix popup `trip_id` issue.
1. Are Custom buttons a must. I prefer pastel clean with Win controls.
1. Ask if manager_home_u:65 SQL 'INNER JOIN' is allowed
1. Ask if popup_editItem_u:31, is that correct way of declaration?
1. Do we need to worry about SQL injection.

## Form-Specific Fixes

### shop_landing_u
- [ ] Make filter and sort fully functional
- [ ] Make search bar search all fields
- [ ] Fix grid column widths

### popup_addToTrip_u
- [ ] Add Cancel button

### popup_editItem_u
- [ ] Dynamic Label
- [ ] Lots of errors, need to debug

## Other
- [ ] Rebrand to Travel Kits
- [ ] Figure out what DM2 is
- [ ] Clean up SQL statements.
- [ ] Hide Delphi logo on Titlebar
- [ ] Rename Controls (Especially DBGrids)
- [ ] DBGrid Field Widths
- [ ] Add Dimensions to Checkout screen
- [ ] Add Stores
---

## Task Requirements

| # | Requirement | Status |
|---|---|---|
| 1 | Insert | ✅ |
| 2 | Update | ✅ |
| 3 | Delete | ✅ |
| 4 | View `*` data from a table (SQL) | ✅ |
| 5 | Two aggregate functions used (SQL) | ⬜ |
| 6 | Two tables in one SQL statement | ✅ |
| 7 | Variable used in SQL | ✅ |
| 8 | One text file read/written/appended to | 🟧 |
| 9 | One array processed | ⬜ |
| 10 | One class from Phase 1's classes/objects list | ✅ |

> Items 4–7 must be pure SQL — one SQL statement can contain more than one requirement.
> Items 8–10 are other code carried over from Phase 1 — once coded, update Phase 1 to match.

---

## Things Left To Do
- [ ] Manager Menu — **4 Aug**
     - [ ] Edit Stores (popup)
     - [ ] Signout button
     - [ ] Resizing and 'Close Query'
- [ ] Admin Menu — **4 Aug**
     - [ ] List ALL Stores
           - [ ] View Items per store
     - [ ] Edit Stores (popup)
     - [ ] Edit Items (popup)
     - [ ] Add/Edit/Delete Users
     - [ ] Signout button
     - [ ] Resizing and Close Query
- [ ] Payment & Checkout — **5 Aug**
     - [ ] 'Payment System' (Add more credits to balance)
     - [ ] Receipt — **5 Aug**
- [ ] Go over Phase 1 — **6 Aug**
- [ ] Go over Phase 2 — **6 Aug**
- [ ] Clean up code — **8 Aug**
     - [ ] check DB
     - [ ] Get rid of Debug Units
     - [ ] Make README
- [ ] Finish any incomplete forms — **8 Aug**
- [ ] GUI and clean dust — **9 Aug**

---

## Unit Progress

**Legend:** `1` Empty · `2` Debug · `3` Functional · `4` GUI · `5` Complete

| Unit | Progress |
|---|---|
| admin_home_u | 1 |
| debug_db_u | 1 |
| DMCommon_u | 1 |
| DMLoginSystem_u | 1 |
| DMUnit | 1 |
| home_u | 1 |
| manager_home_u | 1 |
| shop_landing_u | 1 |
| trip_overview_u | 1 |
| popup_addToTrip_u | 1 |
| Complete | |
| launch_login_u | 5 |
| launch_signup_u | 5 |
| launch_welcome_u | 5 |
