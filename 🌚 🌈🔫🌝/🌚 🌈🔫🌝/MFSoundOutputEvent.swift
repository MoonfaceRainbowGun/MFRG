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
    
    override func prepare(_ userInfos: [[String: Any]]) {
        for userInfo in userInfos {
            if let fileName = userInfo["filename"] as? String {
                
                
                let player = MFSoundPlayer(sound: fileName)
                player.play()
            }
        }
    }
    
    override func run(_ userInfo: Dictionary<String, Any>) {
        if let fileName = userInfo["filename"] as? String {
            let player = MFSoundPlayer(sound: fileName)
            player.play()
        }
    }
    
    override class func defaultInstance() -> MFOutputEvent {
        return MFSoundOutputEvent.sharedInstance
    }
}

