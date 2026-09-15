sap.ui.define([
    "sap/ui/core/IconPool",
    "sap/ui/model/json/JSONModel",
    "sap/m/SelectDialog",
    "sap/m/StandardListItem",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator"
], function (
    IconPool,
    JSONModel,
    SelectDialog,
    StandardListItem,
    Filter,
    FilterOperator
) {
    "use strict";

    return {

        onOpenIconPicker: function (oEvent) {

            const oInput = oEvent.getSource();

            const aIcons = IconPool.getIconNames().map(function (sName) {
                return {
                    name: sName,
                    uri: IconPool.getIconURI(sName)
                };
            });

            const oModel = new JSONModel({
                icons: aIcons
            });

            const oDialog = new SelectDialog({
                title: "Select Icon",
                search: function (oSearchEvent) {

                    const sValue = oSearchEvent.getParameter("value");

                    const oBinding =
                        oSearchEvent.getSource().getBinding("items");

                    if (sValue) {
                        oBinding.filter([
                            new Filter(
                                "name",
                                FilterOperator.Contains,
                                sValue
                            )
                        ]);
                    } else {
                        oBinding.filter([]);
                    }
                },

                confirm: function (oConfirmEvent) {

                    const oSelectedItem =
                        oConfirmEvent.getParameter("selectedItem");

                    if (oSelectedItem) {
                        const sIconUri =
                            oSelectedItem
                                .getBindingContext("icons")
                                .getProperty("uri");

                        oInput.setValue(sIconUri);

                        const oContext = oInput.getBindingContext();

                        if (oContext) {
                            oContext.setProperty("icon", sIconUri);
                        }
                    }
                }
            });

            oDialog.setModel(oModel, "icons");

            oDialog.bindAggregation("items", {
                path: "icons>/icons",
                template: new StandardListItem({
                    title: "{icons>name}",
                    description: "{icons>uri}",
                    icon: "{icons>uri}"
                })
            });

            oDialog.open();
        }
    };
});