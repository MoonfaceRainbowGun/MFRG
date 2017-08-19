//
//  MFXWLBOutputEvent.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 19/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFXWLBOutputEvent: MFOutputEvent {
    
    fileprivate static let sharedInstance = MFXWLBOutputEvent()
    fileprivate var playerDicts = [String: MFSoundPlayer]()
    fileprivate var index = 0
    fileprivate var dindex = 1
    
    override init() {
        // prepare
        // no more coding style
        playerDicts["1"] = MFSoundPlayer(sound: "b1.wav")
        playerDicts["2"] = MFSoundPlayer(sound: "b2.wav")
        playerDicts["3"] = MFSoundPlayer(sound: "b3.wav")
        playerDicts["4"] = MFSoundPlayer(sound: "b4.wav")
        playerDicts["5"] = MFSoundPlayer(sound: "b5.wav")
        playerDicts["6"] = MFSoundPlayer(sound: "b6.wav")
        playerDicts["7"] = MFSoundPlayer(sound: "b7.wav")
        playerDicts["8"] = MFSoundPlayer(sound: "b8.wav")
        playerDicts["9"] = MFSoundPlayer(sound: "b9.wav")
        playerDicts["10"] = MFSoundPlayer(sound: "b10.wav")
        playerDicts["11"] = MFSoundPlayer(sound: "b11.wav")
        playerDicts["12"] = MFSoundPlayer(sound: "b12.wav")
        playerDicts["13"] = MFSoundPlayer(sound: "b13.wav")
        playerDicts["14"] = MFSoundPlayer(sound: "b14.wav")
        playerDicts["15"] = MFSoundPlayer(sound: "b15.wav")
        playerDicts["16"] = MFSoundPlayer(sound: "b16.wav")
        playerDicts["17"] = MFSoundPlayer(sound: "b17.wav")
        playerDicts["18"] = MFSoundPlayer(sound: "b18.wav")
        playerDicts["19"] = MFSoundPlayer(sound: "b19.wav")
        playerDicts["20"] = MFSoundPlayer(sound: "b20.wav")
        playerDicts["21"] = MFSoundPlayer(sound: "b21.wav")
        playerDicts["22"] = MFSoundPlayer(sound: "b22.wav")
        playerDicts["23"] = MFSoundPlayer(sound: "b23.wav")
        playerDicts["24"] = MFSoundPlayer(sound: "b24.wav")
        playerDicts["25"] = MFSoundPlayer(sound: "b25.wav")
    }
    
    override func run(_ userInfo: [String: Any]) {
        
        let players = Array(playerDicts.values)
        let player = players[index]
        index += dindex
        if index == 0 || index == playerDicts.count - 1 {
            dindex *= -1
        }
        player.play()
    }
    
    override class func defaultInstance() -> MFOutputEvent {
        return MFXWLBOutputEvent.sharedInstance
    }
}



