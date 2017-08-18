//
//  MFOutputManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFOutputManager: NSObject {
    static let sharedInstance: MFOutputManager = MFOutputManager()
    
    func prepareOutput(type: OutputEventType, userInfos: [[String: Any]]) {
//        switch type {
//        case .mechanicKeyboardSound:
//            MFSoundOutputEvent.defaultInstance().prepare(userInfos)
//            break
//        }
    }
    
    func executeEvent(type: OutputEventType, userInfo: Dictionary<String, Any>) {
//        switch type {
//        case .mechanicKeyboardSound:
//            MFSoundOutputEvent.defaultInstance().run(userInfo)
//            break
//        }
    }
}
