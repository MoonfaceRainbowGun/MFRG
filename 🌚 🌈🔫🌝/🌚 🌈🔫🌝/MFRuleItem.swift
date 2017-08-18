//
//  MFRule.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

enum InputRuleType: String {
    case keyCode = "KeyCode"
    case string = "String"
    case frequency = "Frequency"
    case regex = "Regex"
}

class RuleItem {
    var input: RuleInput
    var output: RuleOutput
    
    init(input: RuleInput, output: RuleOutput) {
        self.input = input
        self.output = output
    }
}

enum OutputEventType: String {
    case playSound = "PlaySound"
    case synthesizeSound = "SynthesizeSound"
}

public class RuleOutput {
    var type: OutputEventType = .playSound
    var userInfo = [String: Any]()
}

public class RuleInput: Equatable {
    var type: InputRuleType
    var valueString: String?
    var valueInt: Int?
    var valueDouble: Double?
    
    init(_ type: InputRuleType) {
        self.type = type
    }
    
    init(_ keyCode: Int) {
        self.type = InputRuleType.keyCode
        self.valueInt = keyCode
    }
    
    init(_ string: String) {
        self.type = InputRuleType.string
        self.valueString = string
    }
    
    init(_ frequency: Double) {
        self.type = InputRuleType.frequency
        self.valueDouble = frequency
    }
    
    init(regex: String) {
        self.type = InputRuleType.regex
        self.valueString = regex
    }
}


public func ==(lhs: RuleInput, rhs: RuleInput) -> Bool {
    return lhs.type == rhs.type &&
        lhs.valueString == rhs.valueString &&
        lhs.valueInt == rhs.valueInt &&
        lhs.valueDouble == rhs.valueDouble
}
