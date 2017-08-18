//
//  Config.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

struct Config {
    static var rule1 = RuleItem(input: RuleInput("a"), output: ["sound": "a.wav"])
    static var rule2 = RuleItem(input: RuleInput("b"), output: ["sound": "b.wav"])
    static var rule3 = RuleItem(input: RuleInput("c"), output: ["sound": "c.wav"])
    
//    static var ruleInput3 = RuleInput("c")
//    static var ruleOutput3 = RuleOutput(InputRuleType.string, source: "c.wav")
//    static var rule3 = Rule(ruleInput3, ruleOutput3)
    
    static let testRule = Rule(type: "string")
    static let configManager = MFConfigManager()
    
//    static func testConfig() {
//        Config.testRule.add(rule1)
//        Config.testRule.add(rule2)
//        Config.testRule.add(rule3)
//        
//        if configManager.saveRule(rule: Config.testRule, newRuleName: "testRule") == "save succeeded" {
//            print("testRule is saved successfully")
//        } else {
//            print("saving testRule failed")
//        }
//    }
    
    static func testReadConfig() {
        let ruleRead = configManager.loadRule("testRules")!
        
        print("rulesRead.count = \(ruleRead.count())")
        
        for i in 0..<ruleRead.count() {
            print("\(String(describing: ruleRead.list[i].input.viewValue()))")
            print("\(Array(ruleRead.list[i].output.values))")
        }
//        print("\(String(describing: ruleRead.list[0].input.viewValue()))")
//        print("\(Array(ruleRead.list[0].output.values))")
    }
}

struct Constants {
    static let ruleOutputTypeKey = "ruleOutputTypeKey"
    static let ruleOutputUserInfoKey = "ruleOutputUserInfoKey"
    static let ruleInputKey = "ruleInputKey"
    static let ruleOutputKey = "ruleOutputKey"
    
}
