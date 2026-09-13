using expense.tracker as db from '../db/Schema';

service ExpenseTracker @(path: '/tracker') {
    entity Categories          as projection on db.Categories;
    entity Budgets             as projection on db.Budgets;
    entity RecurringPlans      as projection on db.RecurringPlans;

    entity TransactionStatuses as projection on db.TransactionStatuses;

    @odata.draft.enabled
    entity Transactions        as projection on db.Transactions;
}
