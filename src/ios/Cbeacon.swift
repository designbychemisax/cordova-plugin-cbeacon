//
//  Cbeacon.swift
//  HelloCordova
//
//  Created by José María Campaña Rojas on 14/11/15.
//
//

import Foundation
import CoreLocation

@objc(Cbeacon) class Cbeacon : CDVPlugin, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func pluginInitialize () {
        locationManager.delegate = self;
    }
    
    func authorizationStatusWhenInUse (command: CDVInvokedUrlCommand) {
        let permission = CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsBool: permission)
        commandDelegate?.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }
    
    func requestWhenInUseAuthorization (command: CDVInvokedUrlCommand) {
        print("Requesting permissions")
        locationManager.requestWhenInUseAuthorization()
    }
    
}