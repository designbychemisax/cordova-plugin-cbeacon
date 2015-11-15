'use strict';  
  
var exec = require('cordova/exec');  
  
var cBeacon = {  
  
  authorizationStatusWhenInUse: function(onSuccess) {  
    return exec(onSuccess, 'CBeacon', 'authorizationStatusWhenInUse', []);  
  },

  requestWhenInUseAuthorization: function() {  
    return exec(onSuccess, onFail, 'CBeacon', 'requestWhenInUseAuthorization', []);  
  },

  startRangingBeaconsInRegion: function(UUID, identifier, didRangeBeacons) {  
    return exec(onSuccess, onFail, 'CBeacon', 'requestWhenInUseAuthorization', []);  
  }
  
};  
  
module.exports = cBeacon;