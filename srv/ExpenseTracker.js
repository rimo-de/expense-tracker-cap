import cds from '@sap/cds';

class ExpenseTracker extends cds.ApplicationService {

    init() {      
        const { Transactions } = this.entities;

        this.before(
            ['CREATE', 'UPDATE'],
            Transactions,
            this.validateTransactionStatus
        );

        return super.init();
    }

    async validateTransactionStatus(req) {       
        const status_code = req.data.status_code;

        // Nothing to validate if status wasn't supplied
        if (!status_code) return;

        const status = await SELECT.one
            .from('expense.tracker.TransactionStatuses')
            .where({ code: status_code });

        if (!status) {
            req.error(
                400,
                `Invalid transaction status '${status_code}'`,
                'status_code'
            );
        }

    }
}

export default ExpenseTracker;