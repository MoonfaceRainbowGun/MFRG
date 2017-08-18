//
//  MFRule.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

enum InputRuleType: String {
    case keyCode = "keycode"
    case string = "string"
    case frequency = "frequency"
    case null = ""
    
    static func getInputRuleType(_ type: String) -> InputRuleType {
        switch type {
        case InputRuleType.keyCode.rawValue:
            return InputRuleType.keyCode
        case InputRuleType.string.rawValue:
            return InputRuleType.string
        case InputRuleType.frequency.rawValue:
            return InputRuleType.frequency
        default:
            return InputRuleType.null
        }
    }
}

class RuleItem {
    var input: RuleInput
    var output = [String: String]()
    
    init(input: RuleInput, output: [String: String]) {
        self.input = input
        self.output = output
    }
}

enum OutputEventType {
    case playSound, synthesizeSound
}

class RuleOutput {
    var type: OutputEventType = .playSound
    var userInfo = [String: Any]()
}

class RuleInput: Equatable {
    var type: InputRuleType
    var valueString: String?
    var valueInt: Int?
    var valueDouble: Double?
    
    init(_ type: InputRuleType) {
        self.type = type
    }
    
    init(_ keyCode: Int) {
//		print("Debug1")
        self.type = InputRuleType.keyCode
        self.valueInt = keyCode
    }
    
    init(_ string: String) {
//		print("Debug2")
        self.type = InputRuleType.string
        self.valueString = string
    }
    
    init(_ frequency: Double) {
        self.type = InputRuleType.frequency
        self.valueDouble = frequency
    }
    
    func viewValue() -> String {
        switch type {
        case InputRuleType.keyCode:
            return String(describing: valueInt)
        case InputRuleType.string:
            return valueString!
        case InputRuleType.frequency:
            return String(valueDouble!)
        default:
            return ""
        }
    }
}


func ==(lhs: RuleInput, rhs: RuleInput) -> Bool {
    return lhs.type == rhs.type &&
        lhs.valueString == rhs.valueString &&
        lhs.valueInt == rhs.valueInt &&
        lhs.valueDouble == rhs.valueDouble
}
