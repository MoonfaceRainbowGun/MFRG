//
//  MFProcessor.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//


import Cocoa

class MFProcessor: NSObject {

	var trieForKeycode : Trie
	var trieForChar : Trie
	var keycodeRuleMap = [String : RuleOutput]()
	var charRuleMap = [String : RuleOutput]()
	var rateRuleMap = [Double : RuleOutput]()
	fileprivate var buffer : MFBuffer
	init(keyEventBuffer : MFBuffer, rule: Rule){
		
		for ruleItem in rule.list{
			//ruleItem.output
			switch ruleItem.input.type {
			case InputRuleType.keyCode:
				print(String(Character(UnicodeScalar(ruleItem.input.valueInt!)!)))
				keycodeRuleMap[String(Character(UnicodeScalar(ruleItem.input.valueInt!)!))]  = ruleItem.output
				break;
			case InputRuleType.string:
				charRuleMap[ruleItem.input.valueString!] = ruleItem.output
				break;
			case InputRuleType.frequency:
				rateRuleMap[ruleItem.input.valueDouble!] = ruleItem.output
				break;
			default:
				break;
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
				//outputManager.executeEvent(type: OutputEventType.mechanicKeyboardSound, userInfo: keycodeRuleMap[emit.keyword]!)
				print(emit)
				print(emit.outputRule)
			}
		}
	}
	func processCharacterEvent(notification: Notification) {
		let char : Character? = buffer.getChar()
		if char == nil {
			return
		}
		let emits = trieForChar.parseByChar(char: char!)
		if emits.count > 0{
			for emit in emits{
				//outputManager.executeEvent(type: OutputEventType.mechanicKeyboardSound, userInfo: charRuleMap[emit.keyword]!)
				print(emit)
				
			}
		}
		
	}
}
