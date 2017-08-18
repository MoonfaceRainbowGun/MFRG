//
//  MFRule.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

enum InputRuleType: Int {
    case keyCode
    case string
    case frequency
}

class Rule {
    var input: RuleInput
    var output: RuleOutput!
    
    init(_ input: RuleInput, output: RuleOutput) {
        self.input = input
        self.output = output
    }
}

class RuleInput: Equatable {
    var type: InputRuleType
    var valueString: String?
    var valueInt: Int?
    var valueDouble: Double?
    
    init(_ type: InputRuleType) {
        self.type = type
    }
    
}

class RuleOutput {
    var type: InputRuleType
    var userInfo = NSDictionary()
    
    init(_ type: InputRuleType, userInfo: NSDictionary) {
        self.type = type
        self.userInfo = userInfo
    }
}

func ==(lhs: RuleInput, rhs: RuleInput) -> Bool {
    return lhs.type == rhs.type &&
        lhs.valueString == rhs.valueString &&
        lhs.valueInt == rhs.valueInt &&
        lhs.valueDouble == rhs.valueDouble
}
