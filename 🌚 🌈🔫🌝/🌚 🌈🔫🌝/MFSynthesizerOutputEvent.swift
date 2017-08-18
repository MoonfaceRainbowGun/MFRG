//
//  MFSynthesizerOutputEvent.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFSynthesizerOutputEvent: MFOutputEvent {
    
    fileprivate static let sharedInstance = MFSynthesizerOutputEvent()
    
    override func run(_ userInfo: [String: Any]) {
        if let midinote = userInfo["midinote"] as? Int {
            let frequency = 440 / 32 * pow(2, (Float(midinote) - 9.0) / 12.0)
            MFSynthesizer.sharedInstance.play(frequency: frequency, force: 200)
        } else if let frequency = userInfo["frequency"] as? Float32 {
            MFSynthesizer.sharedInstance.play(frequency: frequency, force: 200)
        }
    }
    
    override class func defaultInstance() -> MFSynthesizerOutputEvent {
        return MFSynthesizerOutputEvent.sharedInstance
    }
}


