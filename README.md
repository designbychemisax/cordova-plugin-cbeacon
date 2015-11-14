#Warning

This plugin does not work yet!

It is on GitHub for testing purposes.

#Instalation

```cordova plugin insstall ```

After preparing ios platform, you must add the bridging header for swift

in XCode:

Build Settings > Objective-C Bridging Header : ```(Project Name)/Plugins/Cbeacon-Bridging-Header.h```

Build Settings > Embedded Content Contains Swift Code: ```YES```

Build Settings > Runpath Search Paths: ```@executable_path/Frameworks```

