//
//  Audiobus.swift
//  HOWL
//
//  Created by Daniel Clelland on 2/06/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import AudioKit
import LVGFourCharCodes

class Audiobus {
    
    // MARK: Client
    
    static var client: Audiobus?
    
    // MARK: Actions
    
    static func start() {
        guard client == nil else {
            return
        }
        
        if let apiKey = apiKey {
            client = Audiobus(apiKey: apiKey)
        }
    }
    
    private static var apiKey: String? {
        guard let path = NSBundle.mainBundle().pathForResource("audiobus", ofType: "txt") else {
            return nil
        }
        
        do {
            return try String(contentsOfFile: path)
        } catch {
            return nil
        }
    }
    
    // MARK: Initialization
    
    var controller: ABAudiobusController

    init(apiKey: String) {
        self.controller = ABAudiobusController(apiKey: apiKey)
        
        self.controller.addSenderPort(
            ABSenderPort(
                name: "Sender",
                title: "HOWL (Sender)",
                audioComponentDescription: AudioComponentDescription(
                    componentType: kAudioUnitType_RemoteGenerator,
                    componentSubType: "howg".code!,
                    componentManufacturer: "ptnm".code!,
                    componentFlags: 0,
                    componentFlagsMask: 0
                ),
                audioUnit: AKManager.sharedManager().engine.audioUnit
            )
        )
        
        self.controller.addFilterPort(
            ABFilterPort(
                name: "Filter",
                title: "HOWL (Filter)",
                audioComponentDescription: AudioComponentDescription(
                    componentType: kAudioUnitType_RemoteEffect,
                    componentSubType: "howx".code!,
                    componentManufacturer: "ptnm".code!,
                    componentFlags: 0,
                    componentFlagsMask: 0
                ),
                audioUnit: AKManager.sharedManager().engine.audioUnit
            )
        )
        
        let listener = PropertyListener { (audioUnit, property) in
            let value: UInt32 = try! audioUnit.getProperty(property)
            
            print("WHOA", property, value)
        }
        
        try! AKManager.sharedManager().engine.audioUnit.addPropertyListener(listener, toProperty: kAudioUnitProperty_IsInterAppConnected)
//        try! AKManager.sharedManager().engine.audioUnit.removePropertyListener(listener, fromProperty: kAudioUnitProperty_IsInterAppConnected)
        
        
        let propertyInfo = try! AKManager.sharedManager().engine.audioUnit.getPropertyInfo(kAudioUnitProperty_IsInterAppConnected)
        let property: UInt32 = try! AKManager.sharedManager().engine.audioUnit.getProperty(kAudioUnitProperty_IsInterAppConnected)
        
        print("FUCK", propertyInfo, property)
        
        let parameters = AKManager.sharedManager().engine.audioUnit.parameters
        print("FUCK", parameters)
        
        let notify = RenderNotify { (actionFlags, timestamp, numberOfFrames, buffers) in
//            print(actionFlags, timestamp, numberOfFrames, buffers)
        }
        
        try! AKManager.sharedManager().engine.audioUnit.addRenderNotify(notify)
        
        NSNotificationCenter.defaultCenter().addObserverForName(ABConnectionsChangedNotification, object: nil, queue: nil, usingBlock: { (notification) in
            self.connectionsChanged(notification)
        })
    }
    
    // MARK: Notifications
    
    private func connectionsChanged(notification: NSNotification) {
        if (UIApplication.sharedApplication().applicationState == .Background) {
            if (controller.isConnected()) {
                Audio.start()
            } else {
                Audio.stop()
            }
        }
        
        if (controller.isConnected(toPortOfType: ABPortTypeSender)) {
            Audio.startInput()
        } else {
            Audio.stopInput()
        }
    }

}

extension ABAudiobusController {
    
    func isConnected() -> Bool {
        return connected == true || memberOfActiveAudiobusSession == true
    }
    
    func isConnected(toPortOfType type: ABPortType) -> Bool {
        guard connectedPorts != nil else {
            return false
        }
        
        return connectedPorts.flatMap { $0 as? ABPort }.filter { $0.type == type }.isEmpty == false
    }
    
}
