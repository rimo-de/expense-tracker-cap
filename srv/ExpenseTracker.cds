using expense.tracker as db from '../db/Schema';

service ExpenseTracker @(path: '/tracker') {

    entity CategoryTypes       as projection on db.CategoryTypes;

    @odata.draft.enabled
    entity Categories          as projection on db.Categories;

    @odata.draft.enabled
    entity Budgets             as projection on db.Budgets;

    @odata.draft.enabled
    entity RecurringPlans      as projection on db.RecurringPlans;

    entity Frequencies         as projection on db.Frequencies;
    entity TransactionStatuses as projection on db.TransactionStatuses;

    @odata.draft.enabled
    entity Transactions        as projection on db.Transactions;
}
