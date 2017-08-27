//
//  MFBuffer.swift
//  Sholes
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFBuffer: NSObject {
    
	fileprivate var keyQueue: [Int]
	fileprivate var charQueue: [Character]
    
    override init() {
		keyQueue = [Int]()
		charQueue = [Character]()
        super.init()
        MFKeyboardEventManager.sharedInstance.addBuffer(buffer: self)
        MFCharacterEventManager.sharedInstance.addBuffer(buffer: self)
	}
	func pushKeyCode(keycode: Int) {
		keyQueue.append(keycode)
		notifyKeycode()
	}
	func getKeyCode() -> Int? {
		if !isKeyQueueEmpty() {
			return keyQueue.removeFirst()
		} else {
			return nil
		}
	}

	func isKeyQueueEmpty() -> Bool {
		return keyQueue.isEmpty
	}
	func peekKeyQueue() -> Int? {
		return keyQueue.first
	}
	func sizeKeyQueue() -> Int {
		return keyQueue.count
	}
	func pushChar(char: Character) {
		charQueue.append(char)
		notifyCharcode()
	}
	func getChar() -> Character? {
		if !isCharQueueEmpty() {
			return charQueue.removeFirst()
		} else {
			return nil
		}
	}
	
	func isCharQueueEmpty() -> Bool {
		return charQueue.isEmpty
	}
	func peekCharQueue() -> Character? {
		return charQueue.first
	}
	func sizeCharQueue() -> Int {
		return charQueue.count
	}
	
	func notifyKeycode() {
		let notificationName = Notification.Name(rawValue: "GetKeycodeNotification")
		NotificationCenter.default.post(name: notificationName, object: self,
		                                userInfo: ["value":"Keycode"])
	}
	
	func notifyCharcode() {
		let notificationName = Notification.Name(rawValue: "GetCharacterNotification")
		NotificationCenter.default.post(name: notificationName, object: self,
		                                userInfo: ["value":"Character"])
	}
}
