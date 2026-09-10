# Expense Tracker – SAP CAP

A personal **Expense Tracker application** built using the **SAP Cloud Application Programming Model (CAP)**.

The application is designed to manage income and expenses, define monthly budgets, maintain recurring financial commitments, and provide a foundation for analyzing personal spending through a SAP Fiori-based user interface.

---

## Features

### Categories

Categories provide master data for classifying transactions as either **Income** or **Expense**.

Examples:

- Salary
- Rent
- Groceries
- Transport
- Utilities
- Other Expenses

Categories can also be marked as mandatory and can be activated or deactivated.

---

### Budgets

Budgets allow an amount to be allocated to a specific expense category for a particular month and year.

Example:

```text
Groceries
Year: 2026
Month: September
Allocated Amount: €500
```

The application prevents duplicate budgets for the same combination of:

```text
Category + Year + Month
```

---

### Recurring Plans

Recurring Plans represent financial commitments that occur repeatedly.

Supported frequencies:

- Monthly
- Quarterly
- Yearly

Examples:

| Recurring Plan | Frequency |
|---|---|
| Apartment Rent | Monthly |
| Internet Contract | Monthly |
| ARD Contribution | Quarterly |
| Vehicle Tax | Yearly |

Each recurring plan maintains a **Next Due Date**, which can later be used to generate the corresponding transaction when the payment becomes due.

---

### Transactions

Transactions represent actual income and expense activity.

Each transaction contains:

- Transaction date
- Amount
- Currency
- Description
- Category
- Status
- Optional reference to a Recurring Plan

Supported transaction statuses:

| Code | Status |
|---|---|
| `A` | Pending |
| `C` | Completed |
| `X` | Cancelled |

Transactions can currently be created manually.

Recurring Plans are associated with Transactions so that recurring expenses can later be automatically generated when they become due.

---

## Domain Model

The application currently contains four main business entities:

| Entity | Purpose |
|---|---|
| `Categories` | Master data for Income and Expense categories |
| `Budgets` | Monthly budget allocation for individual categories |
| `RecurringPlans` | Recurring financial commitments |
| `Transactions` | Actual Income and Expense transactions |

### Entity Relationships

```text
Categories
   │
   ├──────── Budgets
   │
   ├──────── RecurringPlans
   │
   └──────── Transactions
                 │
                 │
           RecurringPlans
```

A Category can be associated with multiple Budgets, Recurring Plans and Transactions.

A Transaction can optionally reference the Recurring Plan from which it originated.

---

## Technology Stack

| Technology | Purpose |
|---|---|
| SAP CAP | Application framework |
| Node.js | CAP runtime |
| CDS | Domain and service modelling |
| OData V4 | REST/OData API |
| SQLite | Local development database |
| SAP Fiori / Fiori Elements | User interface *(planned)* |
| SAP HANA Cloud | Production database *(planned)* |
| SAP BTP | Cloud deployment *(planned)* |

---

## OData Service

The CAP application exposes its business entities through an **OData V4 service**.

Current entity sets:

```text
/tracker/Categories
/tracker/Budgets
/tracker/RecurringPlans
/tracker/Transactions
```

The service supports standard CRUD operations:

| HTTP Method | Operation |
|---|---|
| `GET` | Read |
| `POST` | Create |
| `PATCH` | Update |
| `DELETE` | Delete |

OData query capabilities tested include:

```text
$filter
$select
$orderby
$expand
```

Example:

```http
GET /tracker/Transactions?$filter=status eq 'C'
```

```http
GET /tracker/Transactions?$orderby=transactionDate desc
```

```http
GET /tracker/Transactions?$expand=category
```

---

## HTTP / OData Testing

HTTP test cases are maintained in:

```text
test/ExpenseTracker.http
```

The test suite currently covers:

```text
Create Transaction
        │
        ▼
Read Transaction
        │
        ▼
Update Transaction
        │
        ▼
Verify Update
        │
        ▼
OData Queries
        │
        ▼
Delete Transaction
        │
        ▼
Verify Deletion
```

The generated transaction ID from a `POST` request is reused for subsequent GET, PATCH and DELETE operations.

---

## Planned Application Architecture

```text
┌─────────────────────────────┐
│     SAP Fiori Elements      │
│                             │
│  Overview / Dashboard       │
│  Transactions               │
│  Budgets                    │
│  Recurring Plans            │
│  Categories                 │
└──────────────┬──────────────┘
               │
               │ OData V4
               ▼
┌─────────────────────────────┐
│          SAP CAP            │
│                             │
│   Expense Tracker Service   │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│       SAP HANA Cloud        │
└─────────────────────────────┘
               │
               ▼
┌─────────────────────────────┐
│           SAP BTP           │
└─────────────────────────────┘
```

---

## Planned Fiori Application

The Fiori application is planned to use an **Overview / Dashboard page** as the main entry point.

The dashboard will provide an overview of:

- Monthly expenses
- Recent transactions
- Expenses by category
- Budget usage
- Recurring expenses

Users will then be able to navigate to:

```text
Overview / Dashboard
       │
       ├── Transactions
       │       └── Transaction Details
       │
       ├── Budgets
       │
       ├── Recurring Plans
       │
       └── Categories
```

---

## Project Structure

```text
expense-tracker-cap/
│
├── app/
│   └── Fiori applications
│
├── db/
│   ├── CDS domain model
│   └── Initial / sample data
│
├── srv/
│   └── CAP service definitions
│
├── test/
│   └── ExpenseTracker.http
│
├── package.json
└── README.md
```

---

## Run Locally

### Install dependencies

```bash
npm install
```

### Start the CAP application

```bash
cds watch
```

The CAP development server starts locally and exposes the Expense Tracker OData V4 service.

---

## Roadmap

The planned implementation stages are:

1. CAP domain model
2. OData V4 services
3. HTTP / OData testing
4. SAP Fiori Elements UI
5. Expense Overview / Dashboard
6. Recurring transaction generation
7. Authentication and authorization
8. SAP HANA Cloud integration
9. Deployment to SAP BTP
10. CI/CD pipeline
11. SAP Build Work Zone integration

---

## Repository

**Expense Tracker – SAP CAP**

https://github.com/rimo-de/expense-tracker-cap