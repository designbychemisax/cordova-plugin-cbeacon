//
//  CBeacon.swift
//
//  Created by José María Campaña Rojas on 14/11/15.
//
//

import Foundation
import CoreLocation
import CoreBluetooth

@objc(CBeacon) class CBeacon : CDVPlugin, CLLocationManagerDelegate, CBCentralManagerDelegate {

    var centralManager:CBCentralManager!
    let locationManager = CLLocationManager()
    var callbackId = ""

    var status : [String:Bool] = ["permission" : false, "bluetooth" : false]

    override func pluginInitialize () {
        locationManager.delegate = self
        centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
    }

    func register (command: CDVInvokedUrlCommand) {
        print ("\n\ncBeacon by José María Campaña Rojas,\ndesign by chemisax,\nwww.chemisax.com\n\n")
        self.callbackId = command.callbackId
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        pluginResult.setKeepCallbackAsBool(true)
        commandDelegate?.sendPluginResult(pluginResult, callbackId:self.callbackId)
    }

    func getBeaconStatus (command: CDVInvokedUrlCommand) {
        print ("Requesting beacon status")
        self.status["permission"] = CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsDictionary: self.status)
        commandDelegate?.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }

    func requestAuthorization (command: CDVInvokedUrlCommand) {
        print ("Requesting authorization")
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate?.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }

    func centralManagerDidUpdateState(central: CBCentralManager) {
        //Call callback to tell ble state changed;

        switch (central.state) {
        case .PoweredOff:
            print("CoreBluetooth BLE hardware is powered off")
            self.status["bluetooth"] = false

        case .PoweredOn:
            print("CoreBluetooth BLE hardware is powered on and ready")
            self.status["bluetooth"] = true

        case .Resetting:
            print("CoreBluetooth BLE hardware is resetting")
            self.status["bluetooth"] = false

        case .Unauthorized:
            print("CoreBluetooth BLE state is unauthorized")
            self.status["bluetooth"] = false

        case .Unknown:
            print("CoreBluetooth BLE state is unknown")
            self.status["bluetooth"] = false

        case .Unsupported:
            print("CoreBluetooth BLE hardware is unsupported on this platform")
            self.status["bluetooth"] = false
        }
    }

    //Old functions

    func authorizationStatusWhenInUse (command: CDVInvokedUrlCommand) {
        let permission = CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsBool: permission)
        print("authorizationStatusWhenInUse \(permission)")
        commandDelegate?.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }

    func requestWhenInUseAuthorization (command: CDVInvokedUrlCommand) {
        print ("requestWhenInUseAuthorization")
        locationManager.requestWhenInUseAuthorization()
    }

    func startRangingBeaconsInRegion (command: CDVInvokedUrlCommand) {
        let UUID = command.arguments[0] as! String;
        let identifier = command.arguments[1] as! String;
        let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: UUID)!, identifier: identifier)
        print ("start ranging beacons for \(identifier) (\(UUID))")
        self.callbackId = command.callbackId
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
        //print(beacons)

        //commandDelegate?.evalJs("console.log('DidRangeBeacins!')")
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        pluginResult.setKeepCallbackAsBool(true)
        //commandDelegate?.sendPluginResult(pluginResult, callbackId:self.callbackId)
    }

}
