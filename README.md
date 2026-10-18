# Digital Wallet Database Design

A group project for the **Database Technology** course at **BINUS University**, academic year **2024/2025**.

This project designs a relational database for a digital wallet case study inspired by **GoPay**. It focuses on organizing user, wallet, merchant, and transaction data through database normalization and SQL implementation.

## Project Objectives

- Identify redundancy and potential insertion, update, and deletion anomalies.
- Document normalization from unnormalized data through Third Normal Form (3NF).
- Design an Entity-Relationship Diagram (ERD).
- Implement related tables, constraints, and sample records in SQL.

## Database Structure

The SQL implementation contains **12 tables**:

| Table | Purpose |
| --- | --- |
| `user_info` | User account information |
| `wallet_info` | Wallet balances and coin balances |
| `location` | Addresses referenced by users and merchants |
| `merchant_info` | Merchant and payment identification details |
| `balance_topup_method` | User-associated top-up methods |
| `transaction_info` | Shared transaction details |
| `transaction_topup` | Top-up payment methods |
| `transaction_withdrawal` | Withdrawal bank details |
| `transaction_payment` | Merchant payments and order references |
| `transaction_transfer` | Transfer recipients |
| `transaction_cashback` | Cashback sources |
| `transaction_refund` | References to original transactions |

The schema uses primary keys, foreign keys, required fields, enumerated values, and identifier-format checks.

## Implementation Results

The SQL dump includes:

- **5 users**
- **5 wallets**
- **5 merchants**
- **5 locations**
- **30 transactions**, covering six transaction types

Transaction statuses include **Processing**, **Failed**, and **Completed**.

Shared transaction information is stored in `transaction_info`, while separate tables hold details specific to each transaction type. Refund records reference their original transactions, and user and merchant addresses reference the location table.

## Tools

- **SQL**
- **MariaDB** — the supplied dump records version 10.4.32
- **phpMyAdmin** — used to export the database
- **dbdiagram.io** — identified on the supplied ERD

## Project Files

| File | Description |
| --- | --- |
| `aol_kelompok7.sql` | Table definitions, sample records, indexes, and constraints |
| `ERD Kelompok 7.png` | Entity-Relationship Diagram |
| `Sample Data.xlsx` | Optional sample-data workbook |

## How to Use

1. Create an empty database named `aol_kelompok7` in MariaDB.
2. Select the database in phpMyAdmin.
3. Import `aol_kelompok7.sql`.
4. Explore the tables and their relationships.

The dump does not include a `CREATE DATABASE` statement, so the database must be created before importing.

## Scope and Notes

This is an academic database design and implementation project. It includes the schema and sample records; application screens, payment processing, and automatic wallet-balance updates are not implemented.

Some design rules are not enforced in the SQL. For example, `wallet_info.user_id` is not unique, and `transaction_topup` has no primary key. Sample PINs are stored as plain integers.

The SQL has been inspected but has not been independently imported for this README.

## Authors

**Group 7**  
Computer Science and Statistics, BINUS University

- M. Aufa Mumtaza Ibadillah
- Marcell Prasetyo
- Ricardo Xavier Rinzi
