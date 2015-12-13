cordova.define("cordova-plugin-cbeacon.cbeacon", function(require, exports, module) { 'use strict';

    var exec = require('cordova/exec');

    var cBeacon = {

        callbacks : {
            "didRangeBeacons" : []
        },

        errorHandler : function (error) {},

        emptyHandler : function () {},

        swiftAction : function (params) {
            if (params != null) {
                if (params.command == "range") {
                    var callbacks = this.callbacks["didRangeBeacons"];
                    for (var i = 0; i < callbacks.length; i++) {
                        callbacks[i].apply(this, [params]);
                    }
                }
            }
        },

        connect: function() {
            var plugin = this;
            return exec(function (params) {
                plugin.swiftAction.apply(plugin, [params]);
            }, this.errorHandler, 'CBeacon', 'register', []);
        },

        on : function (event, callback) {
            if (this.callbacks[event]) {
                this.callbacks[event].push(callback);
            }
        },

        getBeaconStatus : function (callback) {
            return exec(callback, this.errorHandler, 'CBeacon', 'getBeaconStatus', []);
        },

        requestAuthorization: function() {
            return exec(this.emptyHandler, this.errorHandler, 'CBeacon', 'requestAuthorization', []);
        },

        startRangingBeaconsInRegion: function(UUID, identifier) {
            return exec(this.emptyHandler, this.errorHandler, 'CBeacon', 'startRangingBeaconsInRegion', [UUID, identifier]);
        }

    };

    module.exports = cBeacon;
});
