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
        // THIS IS A FAKE MIDI NOTE!!!
        if let midinote = userInfo["MIDINote"] as? Int {
            let frequency = 440 / 32 * pow(1.3, (Float(midinote) + 86.0) / 12.0)
            MFSynthesizer.sharedInstance.play(frequency: frequency, force: 200)
        } else if let frequency = userInfo["frequency"] as? Float32 {
            MFSynthesizer.sharedInstance.play(frequency: frequency, force: 200)
        }
    }
    
    override class func defaultInstance() -> MFSynthesizerOutputEvent {
        return MFSynthesizerOutputEvent.sharedInstance
    }
}


