//
//  MFProcessor.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//


import Cocoa

class MFProcessor: NSObject {
	fileprivate var buffer : MFBuffer
	init(keyEventBuffer : MFBuffer){
		buffer = keyEventBuffer
		
		super.init()
		
		let notificationKeycodeName = Notification.Name(rawValue: "GetKeycodeNotification")
	NotificationCenter.default.addObserver(self,selector:#selector(processKeycodeEvent(notification:)),name: notificationKeycodeName, object: nil)
		
		let notificationCharName = Notification.Name(rawValue: "GetCharacterNotification")
		
		NotificationCenter.default.addObserver(self,selector:#selector(processCharacterEvent(notification:)),name: notificationCharName, object: nil)
		
		
	}
	func generateTrie(allStringMatchRules: [String]) {
		for i in 0 ..< allStringMatchRules.count{
			print(i)
		}
	}

	func processKeycodeEvent(notification: Notification) {
		let keycode : Int? = buffer.getKeyCode()
		if keycode == nil {
			return
		}
		print(keycode!)
	}
	
	func processCharacterEvent(notification: Notification) {
		let char : Character? = buffer.getChar()
		if char == nil {
			return
		}
		print(char!)
		
	}
}
