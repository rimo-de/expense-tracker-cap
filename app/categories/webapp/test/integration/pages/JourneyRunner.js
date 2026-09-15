sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"expense/tracker/categories/test/integration/pages/CategoriesList.gen",
	"expense/tracker/categories/test/integration/pages/CategoriesObjectPage.gen"
], function (JourneyRunner, CategoriesListGenerated, CategoriesObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('expense/tracker/categories') + '/test/flp.html#app-preview',
        pages: {
			onTheCategoriesListGenerated: CategoriesListGenerated,
			onTheCategoriesObjectPageGenerated: CategoriesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

