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
    
    override init() {
        // prepare
        // no more coding style
        playerDicts["1"] = MFSoundPlayer(sound: "p1.wav")
        playerDicts["2"] = MFSoundPlayer(sound: "p2.wav")
        playerDicts["3"] = MFSoundPlayer(sound: "p3.wav")
        playerDicts["4"] = MFSoundPlayer(sound: "p4.wav")
        playerDicts["5"] = MFSoundPlayer(sound: "p5.wav")
    }
    
    override func run(_ userInfo: [String: Any]) {
        let players = Array(playerDicts.values)
        let player = players[Int(arc4random_uniform(5))]
        player.play()
    }
    
    override class func defaultInstance() -> MFOutputEvent {
        return MFPentatonicOutputEvent.sharedInstance
    }
}


