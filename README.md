
# Point of Sales System for Stationery Store

A simple Point-of-Sales (POS) system for a stationery store, written in Assembly language. This system supports multi-user login (admin and owner roles), multi-level menu navigation, transaction processing with SST (Sales and Service Tax) calculations, and summary/report generation.

## Features

- **Multi-User Login:**  
  - Secure login for Admin and Owner roles.
  - Admins can process sales transactions.
  - Owners can process transactions and generate comprehensive sales reports.

- **Multi-Level Menu Selection:**  
  - Intuitive menu navigation for both Admin and Owner.
  - Item and brand selection for transactions.
  - Admin menu: Do Transaction, Log Out, Owner Login.
  - Owner menu: Do Transaction, View Report, Log Out.

- **Calculation Functions:**  
  - Calculates total price, SST charge (8%), and customer balance.
  - Five key formulas for accurate billing and change calculation.

- **Summary Generation:**  
  - Owners can generate sales summaries and reports for business insights.

## Mathematical Formulas Used

1. **Total Price:**  
   `Total = quantity × unit_price`

2. **Total Before SST Charge:**  
   `TotalBeforeSSTCharge = Total`

3. **Total After SST Charge:**  
   `TotalAfterSSTCharge = (TotalBeforeSSTCharge × 108) / 100`

4. **SST Charge:**  
   `SSTCharge = TotalAfterSSTCharge - TotalBeforeSSTCharge`

5. **Balance to Return:**  
   `Balance = TotalPay - TotalAfterSSTCharge`

## How to Run

1. **Requirements:**  
   - DOSBox or any DOS emulator (for running `.EXE` files on modern systems)
   - The files: `ASSG.EXE`, `ASSG.OBJ`, `assg.asm`

2. **Running the Program:**  
   - Open DOSBox and mount the project directory.
   - Run the executable:  
     ```
     ASSG.EXE
     ```
   - Follow the on-screen instructions for login and menu navigation.

## Intended Users

- Shop owners and admins of a stationery store.
- Students and educators learning Assembly language and POS system logic.

## Notes

- This project is for educational purposes and demonstrates basic POS system logic in Assembly.
- The system is text-based and runs in a DOS environment.
- All calculations and menu navigation are handled via keyboard input.
