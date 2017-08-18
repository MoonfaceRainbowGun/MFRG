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

    func executeEvent(_ ruleOutput: RuleOutput) {
        let type = ruleOutput.type
        let userInfo = ruleOutput.userInfo
        switch type {
        case .playSound:
            MFSoundOutputEvent.defaultInstance().run(userInfo)
            break
            
        case .synthesizeSound:
            MFSynthesizerOutputEvent.defaultInstance().run(userInfo)
            break
        }
    }
}
