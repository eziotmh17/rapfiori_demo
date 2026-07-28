sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"demobookingtmh/test/integration/pages/bookingHeaderList.gen",
	"demobookingtmh/test/integration/pages/bookingHeaderObjectPage.gen",
	"demobookingtmh/test/integration/pages/bookingItemObjectPage.gen"
], function (JourneyRunner, bookingHeaderListGenerated, bookingHeaderObjectPageGenerated, bookingItemObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('demobookingtmh') + '/test/flp.html#app-preview',
        pages: {
			onThebookingHeaderListGenerated: bookingHeaderListGenerated,
			onThebookingHeaderObjectPageGenerated: bookingHeaderObjectPageGenerated,
			onThebookingItemObjectPageGenerated: bookingItemObjectPageGenerated
        },
        async: true
    });

    return runner;
});

