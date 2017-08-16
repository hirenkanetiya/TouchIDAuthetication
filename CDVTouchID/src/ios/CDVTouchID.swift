//
//  CDVTouchID.swift
//  TouchIDAutheticationDemo
//
//  Created by hiren.kanetiya on 8/2/17.
//  Copyright © 2017 Knowarth. All rights reserved.
//

import UIKit
import LocalAuthentication

@objc(CDVTouchID) class CDVTouchID: CDVPlugin {
    
    
    func isAvailable(_ command: CDVInvokedUrlCommand){
        let authenticationContext = LAContext();
        var error:NSError?;
        
        let available = authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error);
        
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Not available");
        if available == true {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Available");
        }
        
        commandDelegate.send(pluginResult, callbackId:command.callbackId);
    }

    
    func authenticate(_ command: CDVInvokedUrlCommand){
        let authenticationContext = LAContext();
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Something went wrong");
        var reason : String = "Authentication is needed to access your apps."

        let data  = command.arguments[0] as AnyObject?;
        
        var policy:LAPolicy = .deviceOwnerAuthenticationWithBiometrics;
        if #available(iOS 9.0, *) {
            policy = .deviceOwnerAuthentication;
        }
        if let disableBackup = data?["disableBackup"] as! Bool? {
            if disableBackup {
                authenticationContext.localizedFallbackTitle = "";
            } else {
                if let localizedFallbackTitle = data?["localizedFallbackTitle"] as! String? {
                    authenticationContext.localizedFallbackTitle = localizedFallbackTitle;
                }
            }
        }
        
        //Localized reason
        if let localizedReason = data?["localizedReason"] , localizedReason != nil {
            reason = localizedReason;
        }else if let clientId = data?["clientId"] , clientId != nil {
            reason = clientId;
        }
        
        authenticationContext.evaluatePolicy(
            policy,
            localizedReason: reason,
            reply: { [unowned self] (success, error) -> Void in
                if( success ) {
                    pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Success");
                }else {
                    // Check if there is an error
                    if error != nil {
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Error: \(error)");
                    }
                }
                self.commandDelegate.send(pluginResult, callbackId:command.callbackId);
        });
    }


}
