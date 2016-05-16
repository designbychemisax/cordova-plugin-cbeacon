![cBeacon](https://cloud.githubusercontent.com/assets/5554982/15291440/df1d65fa-1bb8-11e6-886e-8a1fb2ff9650.jpg)

cBeacon is a cordova plugin for detecting beacons in a simple way using javascript.

It was created using swift and javascript.

#Supported OS

- iOS 8+ 
 
> Since CoreLocation permissions changed a bit in iOS 8, this plugin only supports iOS 8 +

#Installation

Add to config.xml in ```<platform name="ios">```:

```XML
<preference name="deployment-target" value="8.0" />
```

```cordova plugin add https://github.com/designbychemisax/cordova-plugin-cbeacon.git```

```cordova platform add ios``` if not already added.

```cordova prepare```


__Iportant:__ This plugin was created in Swift, so __Swift Bridging Header__ must be specified. 

On XCode go to:

Build Settings > Objective-C Bridging Header : ```(Project Name)/Plugins/cordova-plugin-cbeacon/CBeacon-Bridging-Header.h```

Build Settings > Embedded Content Contains Swift Code: ```YES```

Build Settings > Runpath Search Paths: ```@executable_path/Frameworks```

Add key ```NSLocationWhenInUseUsageDescription``` to ```info.plist``` with a message requesting permision for locaiton services.

If a failed Build attempt was made before: Clean with cmd+Shift+K

Tested on XCode 7.0.1

#Usage

```Javascript

//Start the plugin
cBeacon.connect();

//Add event handler
cBeacon.on("didRangeBeacons", function (params) {
    if (params.beacons.length > 0) {
        //do something
    }
});

//Start Ranging
cBeacon.getBeaconStatus(function (status) {

  console.log("Location permission granted?", status.permission);
  console.log("Bluetooth on?", status.bluetooth); 
  
  if (status.permission && status.bluetooth) {
    //Start ranging beacons
    cBeacon.startRangingBeaconsInRegion("AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE", "testBeacon");
  } else {
    //Request Location info permission
    cBeacon.requestAuthorization();
  }
  
});

```

#TODO
- error handlers

If you want to help to develop this plugin, please fork and send me plugin requests!

#Disclaimer

This plugin is experimental, I made it in one hour, the code is dirty, and it is still in development.
Use at your own risk.

#Licence

The MIT Licence

Copyright (c) 2015 José María Campaña Rojas
design by chemisax
www.chemisax.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
