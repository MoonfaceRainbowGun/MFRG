//
//  MFProcessor.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//


import Cocoa

class MFProcessor: NSObject {
	var slidingWindow  = [Character]()
	var trieForKeycode : Trie
	var trieForChar : Trie
	var keycodeRuleMap = [String : RuleOutput]()
	var charRuleMap = [String : RuleOutput]()
	var rateRuleMap = [Double : RuleOutput]()
	var defaultKeycode : RuleOutput?
	var regularExpression = [NSRegularExpression : RuleOutput]()
	fileprivate var buffer : MFBuffer
	init(keyEventBuffer : MFBuffer, rule: Rule){
		
		for ruleItem in rule.list{
			//ruleItem.output
			switch ruleItem.input.type {
			case InputRuleType.keyCode:
				if (ruleItem.input.valueInt! != -1){
					print(String(Character(UnicodeScalar(ruleItem.input.valueInt!)!)))
					keycodeRuleMap[String(Character(UnicodeScalar(ruleItem.input.valueInt!)!))]  = ruleItem.output
				}else{
					defaultKeycode = ruleItem.output
				}
				

				break
			case InputRuleType.string:
				charRuleMap[ruleItem.input.valueString!] = ruleItem.output
				break
			case InputRuleType.frequency:
				rateRuleMap[ruleItem.input.valueDouble!] = ruleItem.output
				break
            case InputRuleType.regex:
				do {
					let dateRegex =  try NSRegularExpression(pattern: ruleItem.input.valueString!,
					                    options: [])
					regularExpression[dateRegex] = ruleItem.output
					
				}catch {
					print("Wrong regex")
				}
                break
			}
		}
		buffer = keyEventBuffer
		var trieBuilderForKeycode = Trie.builder().removeOverlaps()
		for rule in keycodeRuleMap{
			trieBuilderForKeycode = trieBuilderForKeycode.add(keyword: rule.key, outputRules : rule.value)
		}
		trieForKeycode = trieBuilderForKeycode.build()
		
		var trieBuilderForString = Trie.builder().removeOverlaps()
		for rule in charRuleMap {
			trieBuilderForString = trieBuilderForKeycode.add(keyword: rule.key, outputRules : rule.value)
		}
		trieForChar = trieBuilderForString.build()

		super.init()
		
		let notificationKeycodeName = Notification.Name(rawValue: "GetKeycodeNotification")
	NotificationCenter.default.addObserver(self,selector:#selector(processKeycodeEvent(notification:)),name: notificationKeycodeName, object: nil)
		
		let notificationCharName = Notification.Name(rawValue: "GetCharacterNotification")
		
		NotificationCenter.default.addObserver(self,selector:#selector(processCharacterEvent(notification:)),name: notificationCharName, object: nil)
		
		
	}
	func generateTrieForChars(allStringMatchRules: [String]) {
		for i in 0 ..< allStringMatchRules.count{
			print(i)
		}
	}

	func generateTrieForKeycodes(allKeycodes: [[Int]]) {
		for i in 0 ..< allKeycodes.count{
			print(i)
		}
	}
	
	func processKeycodeEvent(notification: Notification) {
		let keycode : Int? = buffer.getKeyCode()
		if keycode == nil {
			return
		}
		let char = Character(UnicodeScalar(keycode!)!)
		let emits = trieForKeycode.parseByChar(char: char)
		if emits.count > 0{
			for emit in emits{
				MFOutputManager.sharedInstance.executeEvent(emit.outputRule)
			}
		}else{
//			print("Get deafult")
//			print(defaultKeycode)
			if defaultKeycode != nil{
				MFOutputManager.sharedInstance.executeEvent(defaultKeycode!)
			}
			
		}
	}
	func processCharacterEvent(notification: Notification) {
		let char : Character? = buffer.getChar()
		if char == nil {
			return
		}
		if slidingWindow.count == 20{
			slidingWindow.removeFirst()
		}
		slidingWindow.append(char!)
		var current = ""
		_ = 0
//		for char in slidingWindow.reversed(){
//			n+=1
//			current = String(char) + current
//			//if n == slidingWindow.count{
//				print("Debug")
//				print(current)
//				for regex in regularExpression{
//					if regex.key.matches(in: current, options: [], range: NSRange(location: 0,length: n) ).count > 0{
//						print("Regex matches!")
//						MFOutputManager.sharedInstance.executeEvent(regex.value)
//					}
//				}
//			//}
//		}
		for regex in regularExpression{
			var n = 0
			for char in slidingWindow.reversed(){
				n+=1
				current = String(char) + current
				if regex.key.matches(in: current, options: [], range: NSRange(location: 0,length: n) ).count > 0{
					print("Regex matches!")
					MFOutputManager.sharedInstance.executeEvent(regex.value)
					break;
				}
			}
		}
		let emits = trieForChar.parseByChar(char: char!)
		if emits.count > 0 {
			for emit in emits {
				MFOutputManager.sharedInstance.executeEvent(emit.outputRule)
				
			}
		}
		
	}
}
