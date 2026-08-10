                                                                 # RyokoFuku Travel Clothing Kits
### Grade 12 Information Technology — PAT Phase 2
**Charles Fletcher · Grade 12 · South African College Schools (SACS) · 2026**

---

RyokoFuku is a desktop e-commerce application built in Delphi (Object Pascal) for the 2026 Grade 12 IT Practical Assessment Task. The topic is **Information Technology in the Fashion Industry**.

The application solves a real-world problem: travellers struggle to source appropriate clothing for a trip because stock is spread across multiple suppliers with no shared storefront. RyokoFuku centralises this by letting **customers** browse a live catalogue from multiple registered stores, build a "travel kit" by organising items into trips, and check out. **Suppliers (Managers)** log in separately to manage their own store listings. An **Administrator** oversees all users and listings across the platform.

---

## Table of Contents

1. [How to Run the Program](#1-how-to-run-the-program)
2. [Account Types and Test Credentials](#2-account-types-and-test-credentials)
3. [User Guide — Customer](#3-user-guide--customer)
4. [User Guide — Manager (Supplier)](#4-user-guide--manager-supplier)
5. [User Guide — Administrator](#5-user-guide--administrator)
6. [Developer Setup](#6-developer-setup)
7. [Database Reference](#7-database-reference)
8. [File and Unit Reference](#8-file-and-unit-reference)
9. [Known Issues and Limitations](#9-known-issues-and-limitations)
10. [References and Acknowledgements](#10-references-and-acknowledgements)

---

## 1. How to Run the Program

1. Navigate to the `Win32/Debug/` folder.
2. Double-click `ryokofuku_p.exe`.
3. The **Welcome screen** opens. From here you can log in to an existing account or sign up for a new one.

> **Requirement:** `RyokoFukuDB.mdb` must be in the **same folder** as the `.exe`. The program connects to it automatically on launch. If the file is missing or moved, the application will fail to open any data.

No installation is required. The program runs as a standalone executable.

---

## 2. Account Types and Test Credentials

The system has three account levels. Each is routed to a different home screen on login.

| Account Type | `acc_type` value | Home Screen | Purpose |
|---|---|---|---|
| Customer | 1 | Customer Home | Browse shop, manage trips, checkout |
| Manager | 2 | Manager Home | Manage own store's listings and stock |
| Administrator | 3 | Admin Panel | Oversee all users across the platform |

Sample login credentials are pre-loaded in the database for testing:

| Username | Password | Account Type |
|---|---|---|
| `testuser` | `Test1234` | Customer |
| `manager1` | `Test1234` | Manager |
| `admin` | `Test1234` | Administrator |

New customer accounts can be created via the **Sign Up** button on the Welcome screen. New accounts start with a balance of **R1 000.00**.

---

## 3. User Guide — Customer

### 3.1 Signing Up

1. On the Welcome screen, click **Sign Up**.
2. Fill in your **Name**, **Surname**, and a **Username** (minimum 3 characters, no spaces).
3. Enter a **Password** — must be at least 8 characters and include at least one uppercase letter, one lowercase letter, and one number. Retype it to confirm.
4. Enter your **Age** using the spin control (minimum age: 13).
5. Select your **Gender** using the radio buttons.
6. Click **Sign Up**. If any field fails validation, a specific error message will tell you what to fix. On success you are logged in automatically.

> The **Show Password** button toggles password visibility if you need to check what you typed.

### 3.2 Logging In

1. On the Welcome screen, click **Log In**.
2. Enter your **Username** and **Password**.
3. Click **Login**. You will be routed to your home screen based on your account type. If credentials are incorrect, a message will say so.

### 3.3 Customer Home

After login you will see your home screen with your name displayed. From here:

- **Go Shopping** — opens the shop to browse and add items to a trip.
- **Bookings & Trips** — opens your trip overview to manage existing trips.
- **Sign Out** — returns to the Welcome screen.

### 3.4 Shopping

1. Click **Go Shopping** from the home screen.
2. The shop displays all available items from all registered stores. Each row shows availability, item name, description, material, price, sale percentage, store name, and category.
3. **Search**: Type in the search box to filter items by name or description (live filter — updates as you type).
4. **Category**: Use the dropdown to filter by category (e.g. Activewear, Business). Select **All** to clear the filter.
5. To add an item to a trip, click the row to select it, then click **Add to Trip**.
6. A popup appears — select the **Trip** you want to add to (from your existing trips), enter a **Quantity** (minimum 1), and optionally add a **Comment**. Click **Submit**.

> If you have no trips yet, go to **Bookings & Trips** first and create one before trying to add items.

### 3.5 Managing Trips

1. Click **Bookings & Trips** from the home screen.
2. Use the **Trip** dropdown at the top to select an active trip. The item list updates to show everything in that trip.
3. **+ / −** buttons adjust the quantity of the selected item.
4. **Remove** removes the selected item from the trip entirely (asks for confirmation).
5. **New Trip** opens a popup to create a trip with a name, departure date, and return date.
6. **Edit Trip** opens the same popup to change the trip's details.
7. **Delete Trip** permanently deletes the trip and all its items (asks for double confirmation).
8. Once you are happy with your trip, click **Finalise / Checkout**.

### 3.6 Checkout

1. Your current account balance is shown at the top.
2. The grid shows all items in the trip with quantities, comments, unit prices, and line totals.
3. The total cost is shown in the bottom labels.
4. If your balance is too low, click **Add Funds** and enter a top-up amount.
5. Click **Confirm Purchase** to complete the transaction:
   - A formatted receipt is generated in the receipt panel (right side) from the price-locked cart array.
   - Your balance is deducted by the total.
   - You will be asked whether to delete the trip after checkout.
6. Click **Save Receipt** to write the receipt to `Receipt.txt` in the program folder.
7. When done, click **Complete** to return home.

> **Price lock:** Prices are captured into memory the moment you click Confirm. If a supplier updates a price between you loading the screen and clicking the button, your receipt reflects what you saw — not the updated price.

---

## 4. User Guide — Manager (Supplier)

Managers log in the same way as customers. On successful login they are taken directly to the **Manager Home** screen.

### 4.1 Viewing Your Store

- The grid on the left shows all **stores** assigned to your account.
- Click **Edit Store Items** on a selected store to switch the grid to that store's item listings.
- Click **Return to Stores** to go back to the store list.

### 4.2 Managing Items

With a store's items showing:

- **Add Item** — opens the item editor popup to add a new garment listing to this store. Fill in the item details (name, description, material, price, sale %) and click Save.
- **Edit Item** — select a row in the grid, then click Edit to modify the item's details or adjust stock quantities.
- **Delete Item** — select a row and click Delete. Asks for confirmation before removing.

### 4.3 Managing Store Details

- Use the **editor panel** on the right to update store name, category, sub-category, origin region, and description.
- Click **Load Store** to pull the selected store's current details into the editor.
- Click **Update Store / Create Store** to save changes back to the database.
- Click **Delete Store** to remove the store and all its associated stock (permanent — asks for confirmation).

> The status label in the editor shows **Unsaved Changes** (red) when you have modified fields that haven't been saved yet, **Store Found** when an existing record is loaded, and **Store Deleted** after a deletion.

---

## 5. User Guide — Administrator

Administrators are routed to the **Admin Panel** on login.

### 5.1 Viewing Users

The central grid shows all registered users — username, name, surname, account type, balance, and gender. Passwords are not shown in plain text in the grid for security.

### 5.2 Editing a User

1. Click a row to select a user.
2. Click **Edit User** to load their details into the editor panel on the right.
3. Modify any fields — username, password, name, surname, account type (via dropdown), balance, or gender (via toggle).
4. Click **Update User** to save changes back to the database.

> The status label shows **Unsaved Changes** (red) when editor fields have been modified but not yet saved.

### 5.3 Adding a User

1. Click **Clear** to reset the editor.
2. Type a **new username** that does not yet exist. The system will detect whether it is new or existing automatically.
3. Fill in all fields.
4. Click **Add User** to insert the new record.

### 5.4 Deleting a User

1. Select a user in the grid.
2. Click **Delete User**. The system will ask for confirmation.

> **Safety rules:** You cannot delete your own account while logged in. A Manager account that still has stores assigned cannot be demoted or deleted until their stores are reassigned.

---

## 6. Developer Setup

### Requirements

| Requirement | Detail |
|---|---|
| IDE | Embarcadero Delphi / RAD Studio (any edition supporting VCL and ADO) |
| Language | Object Pascal |
| Framework | VCL (Visual Component Library) |
| Database driver | Microsoft Jet OLE DB 4.0 (included with Windows; required for `.mdb` access) |
| Operating system | Windows (32-bit or 64-bit) — compiled for Win32 |

### Opening the Project

1. Open `ryokofuku_p.dproj` in Delphi / RAD Studio.
2. Build the project (F9 or **Run → Run**).
3. The compiled output goes to `Win32/Debug/ryokofuku_p.exe`.
4. Ensure `RyokoFukuDB.mdb` is copied to `Win32/Debug/` before running.

### Database Connection

The connection is configured in `DMUnit.pas` inside `TDataModule1.DataModuleCreate`:

```pascal
ADOConnection1.ConnectionString :=
  'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
  ExtractFilePath(ParamStr(0)) + 'RyokoFukuDB.mdb' +
  ';Persist Security Info=False';
```

`ExtractFilePath(ParamStr(0))` resolves to the folder containing the `.exe` at runtime. This means the `.mdb` file must always sit beside the `.exe`. Do not move one without the other.

### Adding a New Table

1. Create the table in `RyokoFukuDB.mdb` using Microsoft Access.
2. In `DMUnit.pas`, follow the existing pattern — declare a `TADOTable` and a `TDataSource`, create and connect them in `DataModuleCreate`, and open the table in `OpenTables`.
3. The commented-out template lines at the bottom of `DataModuleCreate` show exactly where to add.

### Receipt File

`Receipt.txt` is written to `ExtractFilePath(ParamStr(0))` — the same folder as the `.exe`. This is `Win32/Debug/Receipt.txt` during development.

### Starting Balance

New accounts receive R1 000.00 on signup. This is controlled by the constant `startingCurrency = 1000.00` in `utils_u.pas`. Change it there to adjust the default for all new signups.

---

## 7. Database Reference

**File:** `RyokoFukuDB.mdb` (Microsoft Access, Jet 4.0)

| Table | Primary Key | Purpose |
|---|---|---|
| `tblUsers` | `username` | All registered accounts (customers, managers, admins) |
| `tblStores` | `store_id` | Registered supplier storefronts |
| `tblItems` | `item_id` | Individual garment definitions |
| `tblStock` | `stock_id` | Junction between a store and an item (quantity, price) |
| `tblTrip` | `trip_id` | A customer's named trip with departure and return dates |
| `tblCuratedList` | `curated_id` | Items added to a trip (links tblTrip → tblStock) |

**Key relationships:**

```
tblUsers  ──< tblTrip         (one user, many trips)
tblTrip   ──< tblCuratedList  (one trip, many list items)
tblStock  ──< tblCuratedList  (one stock entry, many list items)
tblStores ──< tblStock        (one store, many stock entries)
tblItems  ──< tblStock        (one item definition, stocked by many stores)
tblUsers  ──< tblStores       (one manager user, manages one or more stores)
```

**Account type values (`acc_type` in tblUsers):**

| Value | Role |
|---|---|
| 1 | Customer |
| 2 | Manager (Supplier) |
| 3 | Administrator |
| 4 | Super-Administrator |

---

## 8. File and Unit Reference

| File | Status | Purpose |
|---|---|---|
| `ryokofuku_p.dpr` | Complete | Main project entry point |
| `DMUnit.pas` | Complete | Core data module — ADO connection, all tables and queries |
| `DMCommon_u.pas` | Complete | Shared UI utilities (window centring, quit confirmation) |
| `utils_u.pas` | Complete | Helper procedures and constants (fixWindow, getNextID, startingCurrency) |
| `user_u.pas` | Complete | TUserSignup and TUserLogin classes; openHome routing |
| `appStrings_u.pas` | Complete | All in-app help text strings (one place, not scattered in forms) |
| `launch_welcome_u.pas` | Complete | Welcome / splash screen |
| `launch_login_u.pas` | Complete | Login modal |
| `launch_signup_u.pas` | Complete | Signup form with full validation |
| `home_u.pas` | Complete | Customer home screen |
| `shop_landing_u.pas` | Complete | Shop browser — search, filter, add to trip |
| `popup_addToTrip_u.pas` | Complete | Popup for selecting trip, quantity, and comment when adding an item |
| `trip_overview_u.pas` | Complete | Trip management — view, edit, remove, finalise |
| `popup_createTrip_u.pas` | Complete | Popup to create or edit a trip |
| `popup_editItem_u.pas` | Complete | Popup to add or edit an item in the Manager panel |
| `checkout_u.pas` | Complete | Checkout — balance check, price-lock array, receipt generation, balance deduction |
| `manager_home_u.pas` | Complete | Manager panel — store and item CRUD |
| `admin_home_u.pas` | Complete | Admin panel — user CRUD across all accounts |
| `debug_db_u.pas` | Dev only | Internal debug form used during development; not accessible from the live app |
| `DMLoginSystem_u.pas` | Deprecated | Earlier version of user logic; superseded by `user_u.pas` — kept for reference |

---

## 9. Known Issues and Limitations

| Issue | Where | Notes |
|---|---|---|
| `popup_editItem_u` has debugging errors | Manager Home | Item edit popup is not yet stable; add/delete from the main grid works correctly |
| No real payment gateway | Checkout | Purchases deduct from an in-app balance only; no bank integration |
| No live shipping or courier tracking | Checkout | Trip dates are for planning purposes; no logistics integration |
| Receipt.txt is overwritten on each checkout | Checkout | The file is always named `Receipt.txt`; if you want to keep multiple receipts, rename the file after saving |
| Jet OLE DB 4.0 is 32-bit only | All | The project is compiled for Win32. On a 64-bit machine the Microsoft Access Database Engine (32-bit version) must be installed if Jet 4.0 is not already present |

---

## 10. References and Acknowledgements

This project was planned and coded by **Charles Fletcher**. The following external sources were consulted during development:

| Source | Used for |
|---|---|
| Stack Overflow — ["Multiple app windows activation not working correctly"](https://stackoverflow.com/questions/802279/multiple-app-windows-activation-not-working-correctly) | The `fixWindow` procedure in `utils_u.pas` — resolves a Delphi VCL bug where secondary forms lose taskbar focus on show |
| Embarcadero Delphi / RAD Studio documentation | VCL component reference, ADO connection strings, TFormatSettings |
| Class materials and teacher guidance | PAT structure, database design requirements, assessment criteria |
| AI assistance (Claude by Anthropic) | Explaining specific Delphi error messages and unfamiliar language behaviour; no code was generated by AI |

> All programming code in this project was written by the author. AI was used only to explain error messages, not to produce or complete any code.

---

*RyokoFuku — "旅行服" — travel clothing.*
*Charles Fletcher · SACS · Grade 12 · 2026*
NOTE The README.md file was generated by AI. It is irrelevant to the core project and serves only as a helpful guide.
