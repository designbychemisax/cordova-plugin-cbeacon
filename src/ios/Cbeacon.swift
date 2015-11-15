//
//  CBeacon.swift
//
//  Created by José María Campaña Rojas on 14/11/15.
//
//

import Foundation
import CoreLocation

@objc(CBeacon) class CBeacon : CDVPlugin, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var callbackId = "";
    
    override func pluginInitialize () {
        locationManager.delegate = self;
    }
    
    func authorizationStatusWhenInUse (command: CDVInvokedUrlCommand) {
        let permission = CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsBool: permission)
        commandDelegate?.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }
    
    func requestWhenInUseAuthorization (command: CDVInvokedUrlCommand) {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startRangingBeaconsInRegion (command: CDVInvokedUrlCommand) {
        let UUID = command.arguments[0] as! String;
        let identifier = command.arguments[1] as! String;
        let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: UUID)!, identifier: identifier)
        locationManager.startRangingBeaconsInRegion(region)
    }
    
    func stopRangingBeaconsInRegion (command: CDVInvokedUrlCommand) {
        let UUID = command.arguments[0] as! String;
        let identifier = command.arguments[1] as! String;
        let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: UUID)!, identifier: identifier)
        locationManager.stopRangingBeaconsInRegion(region)
    }
    
    func didRangeBeacons (command: CDVInvokedUrlCommand) {
        self.callbackId = command.arguments[0] as! String;
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons)
    }
    
}
