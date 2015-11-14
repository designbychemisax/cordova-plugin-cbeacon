#Warning

This plugin does not work yet!

It is on GitHub for testing purposes.

#Supported OS

Since CoreLocation permissions changed a bit in iOS 8, this plugin only supports iOS 8 +

#Installation

To install:

```cordova plugin add https://github.com/chemisax/cordova-plugin-cbeacon.git```

```cordova platform add ios``` if not already added.

```cordova prepare```


__Iportant:__ This plugin was created in Swift, so __Swift Bridging Header__ must be specified. 

On XCode go to:

Build Settings > Objective-C Bridging Header : ```(Project Name)/Plugins/Cbeacon-Bridging-Header.h```

Build Settings > Embedded Content Contains Swift Code: ```YES```

Build Settings > Runpath Search Paths: ```@executable_path/Frameworks```

Tested on XCode 7.0.1

#Usage

(future usage)


