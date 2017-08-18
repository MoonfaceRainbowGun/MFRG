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
    var soundId: SystemSoundID = 0
    
    func prepareSound() {
        if let path = Bundle.main.path(forResource: "keyboard1.wav", ofType: "") {
            let url = URL(fileURLWithPath: path)
            AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        }
    }
    
    func playSound(_ filename: String) {
        AudioServicesPlaySystemSound(soundId)
    }
    
}

