//
//  MFCharacterEventManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFCharacterEventManager: NSObject {
    static let sharedInstance: MFCharacterEventManager = MFCharacterEventManager()
    
    override init() {
        super.init()
    }
    
    func startListening() {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { (e) in
            print("CHAR:\(e.characters ?? "")");
        }
    }
}
