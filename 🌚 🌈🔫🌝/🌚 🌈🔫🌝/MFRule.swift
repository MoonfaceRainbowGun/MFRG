//
//  MFRuleList.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class Rule {
    var type: InputRuleType
    var list = [RuleItem]()
    
    init(type: String) {
        self.type = InputRuleType.getInputRuleType(type)
    }
    
    init(plist: [String: [[String: [String: String]]]]) {
        self.type = InputRuleType.getInputRuleType(Array(plist.keys)[0])
        let ruleItemDictList = plist[self.type.rawValue]!
        for ruleItemDict in ruleItemDictList {
            let inputValue = Array(ruleItemDict.keys)[0]
            let output = ruleItemDict[inputValue]!
            
            let input = RuleInput(inputValue)
            let ruleItem = RuleItem(input: input, output: output)
            self.list.append(ruleItem)
        }
    }
    
    func getRuleItem(_ inputSource: RuleInput) -> RuleItem? {
        return list.filter{$0.input == inputSource}[0]
    }
    
    func add(_ newRuleItem: RuleItem) {
        if newRuleItem.input.type.rawValue == self.type.rawValue {
            list.append(newRuleItem)
//            return true
//        } else {
//            return false
        }
        
    }

    func count() -> Int {
        return list.count
    }
    
    func toPList() -> [String: [[String: [String: String]]]] {
        var plist = [String: [[String: [String: String]]]]()
        var ruleItemDictList = [[String: [String: String]]]()
        for ruleItem in list {
            ruleItemDictList.append([ruleItem.input.viewValue(): ruleItem.output])
        }
        plist[type.rawValue] = ruleItemDictList
        
        return plist
    }
}
