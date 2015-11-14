'use strict';  
  
var exec = require('cordova/exec');  
  
var CBeacon = {  
  
  echo: function(sendMsg, onSuccess, onFail) {  
    return exec(onSuccess, onFail, 'Cbeacon', 'echo', []);  
  }  
  
};  
  
module.exports = CBeacon;  