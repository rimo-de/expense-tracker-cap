sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"expense/tracker/transactions/test/integration/pages/TransactionsList.gen",
	"expense/tracker/transactions/test/integration/pages/TransactionsObjectPage.gen"
], function (JourneyRunner, TransactionsListGenerated, TransactionsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('expense/tracker/transactions') + '/test/flp.html#app-preview',
        pages: {
			onTheTransactionsListGenerated: TransactionsListGenerated,
			onTheTransactionsObjectPageGenerated: TransactionsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

