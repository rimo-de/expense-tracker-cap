namespace expense.tracker;

// @sap.cds.commons are reusbale aspects
using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

// Custom Types : Enumerations
type CategoryType      : Integer enum {
    Income = 1;
    Expense = 2;
}

type Frequency         : Integer enum {
    Monthly = 1;
    Quarterly = 2;
    Yearly = 3;
}

type TransactionStatus : String(1) enum {
    Pending = 'A';
    Completed = 'C';
    Cancelled = 'X';
}

entity Categories : cuid, managed {
    name        : localized String(80) not null; // Category name, e.g. Food, Salary or Rent
    type        : CategoryType  @assert.range: true  @mandatory; // Category type: Income or Expense
    description : localized String(255); // Optional detailed description
    icon        : String(50); // SAP icon name used in the UI
    color       : String(7); // Hex colour code, e.g. #FF5733
    mandatory   : Boolean default false; // Whether this is an essential expense category
    active      : Boolean default true; // Enables or disables the category
}

// This annotation make sure that combination defined remains unique
@assert.unique.budgetPerCategoryMonth: [
    category,
    year,
    month
]
entity Budgets : cuid, managed {
    year           : Integer not null; // Budget year, e.g. 2026
    month          : Integer not null; // Budget month: 1 to 12
    allocateAmount : Decimal(15, 2) not null; // Maximum amount allocated to the category
    currency       : Currency not null; // Currency code, e.g. EUR
    notes          : String(255); // Optional budget notes
    category       : Association to Categories not null; // Category for which the budget is allocated
}

entity RecurringPlans : cuid, managed {
    name        : String(100) not null @mandatory; // e.g. Apartment Rent
    description : String(255); // Optional description
    amount      : Decimal(15, 2) not null; // Amount for each occurrence
    currency    : Currency not null; // Currency code, e.g. EUR
    category    : Association to Categories not null;
    frequency   : Frequency            @assert.range: true  @mandatory;
    startDate   : Date not null        @mandatory; // Plan becomes valid from this date
    endDate     : Date; // Optional
    nextDueDate : Date not null; // Next transaction to be generated
    active      : Boolean not null default true; // Enable/disable plan
}

entity Transactions : cuid, managed {
    transactionDate : Date not null @mandatory; // Date of income/expense
    amount          : Decimal(15, 2) not null; //  Transaction amount
    currency        : Currency not null; // Currency code, e.g. EUR
    description     : String(255); // e.g. REWE groceries
    status          : TransactionStatus default 'A';
    category        : Association to Categories not null;
    recurringPlan   : Association to RecurringPlans;
}
