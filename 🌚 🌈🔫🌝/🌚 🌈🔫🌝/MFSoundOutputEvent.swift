//
//  MFSoundOutputEvent.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFSoundOutputEvent: MFOutputEvent {
    
    fileprivate static let sharedInstance = MFSoundOutputEvent()
    fileprivate var playerDicts = [String: MFSoundPlayer]()
    
    override func run(_ userInfo: [String: Any]) {
//        if let fileName = userInfo["FileName"] as? String {
        let fileName = "D.mp3"
            if playerDicts[fileName] == nil {
                playerDicts[fileName] = MFSoundPlayer(sound: fileName)
            }
            let player = playerDicts[fileName]!
            player.play()
//        }
    }
    
    override class func defaultInstance() -> MFOutputEvent {
        return MFSoundOutputEvent.sharedInstance
    }
}

