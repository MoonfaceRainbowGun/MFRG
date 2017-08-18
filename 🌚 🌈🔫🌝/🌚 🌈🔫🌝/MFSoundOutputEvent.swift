//
//  MFSoundOutputEvent.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFSoundOutputEvent: MFOutputEvent {
    override class func run(_ userInfo: Dictionary<String, Any>) {
        if let fileName = userInfo["filename"] {
            print(fileName)
            MFSoundPlayer.sharedInstance.playSound(fileName as! String)
        }
    }
}

