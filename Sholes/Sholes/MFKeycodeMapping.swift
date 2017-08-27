//
//  MFKeycodeMapping.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 19/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Carbon.HIToolbox
import Foundation

class MFKeycodeMapping: NSObject {
    class func generateMapping() {
        let base = 60
        var mappings: [Int: Int] = [
            kVK_ANSI_Grave: 0,
            kVK_ANSI_1: 24,
            kVK_ANSI_2: 1,
            kVK_ANSI_3: 25,
            kVK_ANSI_4: 2,
            kVK_ANSI_5: 26,
            kVK_ANSI_6: 3,
            kVK_ANSI_7: 27,
            kVK_ANSI_8: 4,
            kVK_ANSI_9: 28,
            kVK_ANSI_0: 5,
            kVK_ANSI_Minus: 29,
            kVK_ANSI_Equal: 7,
            kVK_Delete: 30,
            kVK_Tab: 8,
            kVK_ANSI_Q: 0,
            kVK_ANSI_W: 9,
            kVK_ANSI_E: 1,
            kVK_ANSI_R: 10,
            kVK_ANSI_T: 2,
            kVK_ANSI_Y: 11,
            kVK_ANSI_U: 3,
            kVK_ANSI_I: 12,
            kVK_ANSI_O: 4,
            kVK_ANSI_P: 13,
            kVK_ANSI_LeftBracket: 5,
            kVK_ANSI_RightBracket: 14,
            kVK_ANSI_Backslash: 6,
            kVK_CapsLock: 15,
            kVK_ANSI_A: 7,
            kVK_ANSI_S: 16,
            kVK_ANSI_D: 8,
            kVK_ANSI_F: 17,
            kVK_ANSI_G: 9,
            kVK_ANSI_H: 18,
            kVK_ANSI_J: 10,
            kVK_ANSI_K: 19,
            kVK_ANSI_L: 11,
            kVK_ANSI_Semicolon: 20,
            kVK_ANSI_Quote: 12,
            kVK_Return: 21,
            kVK_Shift: 13,
            kVK_ANSI_Z: 22,
            kVK_ANSI_X: 14,
            kVK_ANSI_C: 23,
            kVK_ANSI_V: 15,
            kVK_ANSI_B: 24,
            kVK_ANSI_N: 16,
            kVK_ANSI_M: 25,
            kVK_ANSI_Comma: 17,
            kVK_ANSI_Period: 26,
            kVK_ANSI_Slash: 18,
            kVK_RightShift: 27,
            kVK_Function: 19,
            kVK_Control: 28,
            kVK_Option: 20,
            kVK_Command: 29,
            kVK_Space: 21,
            kVK_LeftArrow: 30,
            kVK_RightArrow: 22,
            kVK_DownArrow: 31,
            kVK_UpArrow: 23,
            -1: 5
        ]
        

        for (k, v) in mappings {
            mappings[k] = v + base
        }

        var array = [Any]()
        for (k, v) in mappings {
            let inputDict: [String: Any] = [
                "InputType": "KeyCode",
                "InputValue": String(k)
            ]
            
            let outputDict: [String: Any] = [
                "OutputType": "SynthesizeSound",
                "OutputUserInfo": [
                    "MIDINote": v
                ]
            ]
            
            let dict = [
                "Input": inputDict,
                "Output": outputDict
            ]
            
            array.append(dict)
        }
        
        let plistDict: NSDictionary = ["Rules": array];
        let url = URL(fileURLWithPath: "/Users/leimingyu/Desktop/midi.plist")
        plistDict.write(to: url, atomically: false)
    }
}
