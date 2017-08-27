//
//  MFPentatonicOutputEvent.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 19/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFPentatonicOutputEvent: MFOutputEvent {
    
    fileprivate static let sharedInstance = MFPentatonicOutputEvent()
    fileprivate var playerDicts = [String: MFSoundPlayer]()
    fileprivate var index = 0
//    fileprivate var dindex = 1
    
    override init() {
        // prepare
        // no more coding style
        playerDicts["1"] = MFSoundPlayer(sound: "p1.wav")
        playerDicts["2"] = MFSoundPlayer(sound: "p2.wav")
        playerDicts["3"] = MFSoundPlayer(sound: "p3.wav")
        playerDicts["4"] = MFSoundPlayer(sound: "p4.wav")
        playerDicts["5"] = MFSoundPlayer(sound: "p5.wav")
        playerDicts["6"] = MFSoundPlayer(sound: "p6.wav")
        playerDicts["7"] = MFSoundPlayer(sound: "p7.wav")
        playerDicts["8"] = MFSoundPlayer(sound: "p8.wav")
        playerDicts["9"] = MFSoundPlayer(sound: "p9.wav")
        playerDicts["10"] = MFSoundPlayer(sound: "p10.wav")
    }
    
    override func run(_ userInfo: [String: Any]) {
        
        let players = Array(playerDicts.values)
        let player = players[Int(arc4random_uniform(UInt32(players.count)))]
//        let player = players[index]
//        index += dindex
//        if index == 0 || index == playerDicts.count - 1 {
//            dindex *= -1
//        }
        player.play()
    }
    
    override class func defaultInstance() -> MFOutputEvent {
        return MFPentatonicOutputEvent.sharedInstance
    }
}


