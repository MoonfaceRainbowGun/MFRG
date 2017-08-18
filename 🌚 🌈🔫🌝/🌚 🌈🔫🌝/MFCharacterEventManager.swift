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
    fileprivate var buffers = Set<MFBuffer>()
    
    override init() {
        super.init()
    }
    
    func startListening() {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { (e) in
            if let string = e.characters {
                self.notifyBufferForCharacter(char: string)
            }
        }
    }
    
    func addBuffer(buffer: MFBuffer) {
        self.buffers.insert(buffer)
    }
    
    fileprivate func notifyBufferForCharacter(char: String) {
        for buffer in self.buffers {
            for i in 0..<char.characters.count {
                let index = char.characters.index(char.characters.startIndex, offsetBy: i)
                buffer.pushChar(char: char.characters[index])
            }
        }
    }
}
