cordova.define("cordova-plugin-cbeacon.cbeacon", function(require, exports, module) { 'use strict';

    var exec = require('cordova/exec');

    var cBeacon = {

        callbacks : {
            "didRangeBeacons" : []
        },

        errorHandler : function (error) {},

        emptyHandler : function () {},

        swiftAction : function (params) {
            alert("received command from objective c");
        },

        connect: function() {
            alert("connecting cBeacon");
            return exec(this.swiftAction, this.errorHandler, 'CBeacon', 'register', []);
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

        /**
         * Old commands
         * @param onSuccess
         * @returns {*}
         */
        authorizationStatusWhenInUse: function(onSuccess) {
            return exec(onSuccess, 'CBeacon', 'authorizationStatusWhenInUse', []);
        },



        startRangingBeaconsInRegion: function(UUID, identifier, didRangeBeacons) {
            return exec(onSuccess, onFail, 'CBeacon', 'requestWhenInUseAuthorization', []);
        }

    };

    module.exports = cBeacon;
});
