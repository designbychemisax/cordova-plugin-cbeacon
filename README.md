#Warning

This plugin does not work yet!

It is on GitHub for testing purposes.

#Instalation

To install:

```cordova plugin add https://github.com/chemisax/cbeacon.git```

```cordova platform add ios``` if not already added.

```cordova prepare```


This plugin was created in Swift, so Swift Bridging Headers must be configured. 

On XCode go to:

Build Settings > Objective-C Bridging Header : ```(Project Name)/Plugins/Cbeacon-Bridging-Header.h```

Build Settings > Embedded Content Contains Swift Code: ```YES```

Build Settings > Runpath Search Paths: ```@executable_path/Frameworks```

Tested on XCode 7.0.1

