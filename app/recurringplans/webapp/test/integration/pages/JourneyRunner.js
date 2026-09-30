sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"expense/tracker/recurringplans/test/integration/pages/RecurringPlansList.gen",
	"expense/tracker/recurringplans/test/integration/pages/RecurringPlansObjectPage.gen"
], function (JourneyRunner, RecurringPlansListGenerated, RecurringPlansObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('expense/tracker/recurringplans') + '/test/flp.html#app-preview',
        pages: {
			onTheRecurringPlansListGenerated: RecurringPlansListGenerated,
			onTheRecurringPlansObjectPageGenerated: RecurringPlansObjectPageGenerated
        },
        async: true
    });

    return runner;
});

