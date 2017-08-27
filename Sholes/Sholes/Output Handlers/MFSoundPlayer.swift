//
//  MFFastSoundPlayer.swift
//  Sholes
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa
import AudioToolbox

class MFSoundPlayer: NSObject {
    static let sharedInstance = MFSoundPlayer(sound: "keyboard1")
    var sound: FISound?
    
    init(sound: String) {
        super.init()
        self.prepareSound(sound);
    }
    
    fileprivate func prepareSound(_ fileName: String) {
        if let soundEngine = FISoundEngine.shared() {
            self.sound = try? soundEngine.soundNamed(fileName, maxPolyphony: 4)
        }
    }
    
    func play() {
        self.sound?.play()
    }
    
}

