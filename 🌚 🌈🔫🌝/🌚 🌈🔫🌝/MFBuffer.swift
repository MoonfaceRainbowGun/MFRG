//
//  MFBuffer.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFBuffer: NSObject {
	var keyQueue: [Int]
	var charQueue: [Character]
	override init() {
		keyQueue = [Int]()
		charQueue = [Character]()
	}
	func pushKeyCode(keycode: Int) {
		keyQueue.append(keycode)
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
}
