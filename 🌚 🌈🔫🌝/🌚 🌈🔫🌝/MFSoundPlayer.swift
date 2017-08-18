//
//  MFSoundPlayer.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa
import AVFoundation

class MFSoundPlayer: NSObject {
    static let sharedInstance: MFSoundPlayer = MFSoundPlayer()
    var players = Dictionary<String, AVAudioPlayer>()
    var playingPlayer: AVAudioPlayer?
    
    func playSound(_ filename: String) {
        if playingPlayer != nil {
            playingPlayer?.currentTime = 0
        }
        
        if let player = players[filename] {
            player.play()
        } else {
            if let path = Bundle.main.path(forResource: filename, ofType: "") {
                let url = URL(fileURLWithPath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    players[filename] = player
                    playingPlayer = player
                    player.prepareToPlay()
                    player.play()
                } catch {
                    print("\(filename) not found")
                }
            } else {
                print("\(filename) not found")
            }

        }
    }

}
