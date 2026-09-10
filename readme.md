# Expense Tracker – SAP CAP

A personal expense tracking application built using the **SAP Cloud Application Programming Model (CAP)**.

The application is designed to manage income and expenses, define monthly budgets, maintain recurring financial commitments, and provide a foundation for analyzing personal spending through a SAP Fiori-based user interface.

## Features

### Categories

Categories classify financial transactions as either **Income** or **Expense**.

Examples:

- Salary
- Rent
- Groceries
- Transport
- Utilities
- Other Expenses

Categories can also be configured as mandatory or inactive.

### Budgets

Budgets allow spending limits to be planned for individual expense categories for a specific month and year.

For example:

> Groceries → September 2026 → €500

The application prevents duplicate budgets for the same **Category + Year + Month** combination.

### Recurring Plans

Recurring Plans represent expenses that occur repeatedly.

Supported frequencies:

- Monthly
- Quarterly
- Yearly

Examples include:

- Apartment rent – Monthly
- Internet contract – Monthly
- ARD contribution – Quarterly
- Vehicle tax – Yearly

Each recurring plan maintains its next due date so that transactions can later be generated when payments become due.

### Transactions

Transactions represent actual income and expense activity.

A transaction contains:

- Transaction date
- Amount and currency
- Category
- Description
- Status
- Optional reference to a recurring plan

Supported transaction statuses:

- `A` – Pending
- `C` – Completed
- `X` – Cancelled

Transactions can either be entered manually or, in a later implementation, generated from recurring plans.

## Domain Model

The application currently contains four main business entities:

| Entity | Purpose |
|---|---|
| `Categories` | Master data for income and expense categories |
| `Budgets` | Monthly budget allocation by category |
| `RecurringPlans` | Recurring financial commitments |
| `Transactions` | Actual income and expense transactions |

The entities are connected through CAP associations.

## Technology Stack

- SAP Cloud Application Programming Model (CAP)
- Node.js
- CDS
- OData V4
- SQLite for local development
- SAP Fiori / Fiori Elements *(planned)*
- SAP HANA Cloud *(planned)*
- SAP Business Technology Platform *(planned)*

## OData Service

The CAP service exposes the application's business entities through an **OData V4 API**.

Current entity sets include:

```text
/tracker/Categories
/tracker/Budgets
/tracker/RecurringPlans
/tracker/Transactions