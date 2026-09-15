sap.ui.define([
    "sap/ui/unified/ColorPickerPopover"
], function (ColorPickerPopover) {
    "use strict";

    return {

        onOpenColorPicker: function (oEvent) {

            const oButton = oEvent.getSource();
            const oContext = oButton.getBindingContext();

            if (!oContext) {
                return;
            }

            const sCurrentColor =
                oContext.getProperty("color") || "#FFFFFF";

            const oColorPicker = new ColorPickerPopover({
                colorString: sCurrentColor,

                change: function (oChangeEvent) {

                    const sRgb =
                        oChangeEvent.getParameter("colorString");

                    const aMatch = sRgb.match(/\d+/g);

                    if (!aMatch || aMatch.length < 3) {
                        return;
                    }

                    const sHex =
                        "#" +
                        aMatch
                            .slice(0, 3)
                            .map(function (sValue) {
                                return parseInt(sValue, 10)
                                    .toString(16)
                                    .padStart(2, "0");
                            })
                            .join("")
                            .toUpperCase();

                    oContext.setProperty("color", sHex);
                }
            });

            oColorPicker.openBy(oButton);
        }

    };
});