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
        let mapping = [
            kVK_ANSI_Grave: 0,
            kVK_ANSI_1: 32,
            kVK_ANSI_2: 1,
            kVK_ANSI_3: 33,
            kVK_ANSI_4: 2,
            kVK_ANSI_5: 34,
            kVK_ANSI_6: 3,
            kVK_ANSI_7: 35,
            kVK_ANSI_8: 4,
            kVK_ANSI_9: 36,
            kVK_ANSI_0: 5,
            kVK_ANSI_Minus: 37,
            kVK_ANSI_Equal: 7,
            kVK_Delete: 38,
            kVK_Tab: 8,
            kVK_ANSI_Q: 39,
            kVK_ANSI_W: 9,
            kVK_ANSI_E: 40,
            kVK_ANSI_R: 10,
            kVK_ANSI_T: 41,
            kVK_ANSI_Y: 11,
            kVK_ANSI_U: 42,
            kVK_ANSI_I: 12,
            kVK_ANSI_O: 43,
            kVK_ANSI_P: 13,
            kVK_ANSI_LeftBracket: 44,
            kVK_ANSI_RightBracket: 14,
            kVK_ANSI_Backslash: 45,
            kVK_CapsLock: 15,
            kVK_ANSI_A: 46,
            kVK_ANSI_S: 16,
            kVK_ANSI_D: 47,
            kVK_ANSI_F: 17,
            kVK_ANSI_G: 48,
            kVK_ANSI_H: 18,
            kVK_ANSI_J: 49,
            kVK_ANSI_K: 19,
            kVK_ANSI_L: 50,
            kVK_ANSI_Semicolon: 20,
            kVK_ANSI_Quote: 51,
            kVK_Return: 21,
            kVK_Shift: 52,
            kVK_ANSI_Z: 22,
            kVK_ANSI_X: 53,
            kVK_ANSI_C: 23,
            kVK_ANSI_V: 54,
            kVK_ANSI_B: 24,
            kVK_ANSI_N: 55,
            kVK_ANSI_M: 25,
            kVK_ANSI_Comma: 56,
            kVK_ANSI_Period: 26,
            kVK_ANSI_Slash: 57,
            kVK_RightShift: 27,
            kVK_Function: 58,
            kVK_Control: 28,
            kVK_Option: 59,
            kVK_Command: 29,
            kVK_Space: 60,
            kVK_LeftArrow: 30,
            kVK_RightArrow: 61,
            kVK_DownArrow: 31,
            kVK_UpArrow: 62
        ]
        
        for (k, v) in mapping {
            mapping[k] = v + base
        }
    }
}
