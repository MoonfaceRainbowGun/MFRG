//
//  MFFastSoundPlayer.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa
import AudioToolbox

class MFFastSoundPlayer: NSObject {
    static let sharedInstance: MFFastSoundPlayer = MFFastSoundPlayer()
    var sound: FISound?
    
    
    func prepareSound() {
        if let soundEngine = FISoundEngine.shared() {
            self.sound = try! soundEngine.soundNamed("keyboard1.wav", maxPolyphony: 4)
        }
    }
    
    func playSound(_ filename: String) {
        self.sound?.play()
    }
    
}

