//
//  MFRuleList.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class Rule {
    var list = [RuleItem]()
	var displayName: String = "Default Theme"
    
    convenience init(plistName: String) {
        let url = Bundle.main.url(forResource: plistName, withExtension: "plist")!
        let configFileListDictionary = NSDictionary(contentsOf: url) as! [String: Any]
        self.init(plist: configFileListDictionary)
    }
    
    init(plist: [String: Any]) {
        let rulesDictionary = plist["Rules"] as! [[String: Any]]
		if let displayName = plist["Name"] as? String {
			self.displayName = displayName
		}
		
        for ruleItemDict in rulesDictionary {
            let inputDict = ruleItemDict["Input"] as! [String: String];
            
            let inputType = InputRuleType(rawValue: inputDict["InputType"]!)!
            let inputValue = inputDict["InputValue"]!
            
			var input: RuleInput!
			switch inputType {
                case .keyCode:
                    input = RuleInput(Int(inputValue)!)
                case InputRuleType.frequency:
                    input = RuleInput(Double(inputValue)!)
                default:
                    input = RuleInput(inputValue)
			}
            input.type = inputType
            
            
            let outputDict = ruleItemDict["Output"] as! [String: Any]
            
            let outputType = OutputEventType(rawValue: outputDict["OutputType"] as! String)!
            let outputUserInfo = outputDict["OutputUserInfo"] as! [String: Any]
            
            
            let output = RuleOutput()
            output.type = outputType
            output.userInfo = outputUserInfo
            
            
            let ruleItem = RuleItem(input: input, output: output)
            self.list.append(ruleItem)
        }
    }
}
