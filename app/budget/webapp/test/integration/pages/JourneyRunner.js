sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"expense/tracker/budget/test/integration/pages/BudgetsList.gen",
	"expense/tracker/budget/test/integration/pages/BudgetsObjectPage.gen"
], function (JourneyRunner, BudgetsListGenerated, BudgetsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('expense/tracker/budget') + '/test/flp.html#app-preview',
        pages: {
			onTheBudgetsListGenerated: BudgetsListGenerated,
			onTheBudgetsObjectPageGenerated: BudgetsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

