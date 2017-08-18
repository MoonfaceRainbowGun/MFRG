//
//  MFProcessor.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//


import Cocoa

class MFProcessor: NSObject {
	
//	struct Node {
//		var next:  [Character : UnsafePointer<Node>]
//		var parent : UnsafePointer<Node>?
//		var fail : UnsafePointer<Node>?
//		var inputChar : Character?
//		var patternTag : Int
//		var patternNo : [Int]
//	}
//	var pattern : [String] = ["nihao","hao","hs","hsr"];
//	
//	func getNewNode() -> UnsafePointer<Node> {
//		var tnode : Node = Node(next: <#[Character : UnsafePointer<MFProcessor.Node>]#>,
//		                        parent: nil,
//		                        fail : nil,
//		                        inputChar : nil,
//		                        patternTag : 0,
//								patternNo : [Int]())
//		return withUnsafePointer(to: &tnode, {$0});
//	}
//	
//	func nodeToQueue(root : UnsafePointer<Node> , myqueue : UnsafePointer<[<UnsafePointer<Node>>>]) -> Int{
//		var i : Int;
//		
//		for (i = 0; i < 26; i++){
//			if (root->next[i]!=NULL)
//			myqueue.push(root->next[i]);
//		}
//
//		return 0;
//	}

	
	
	
	fileprivate var buffer : MFBuffer
	init(keyEventBuffer : MFBuffer){
		buffer = keyEventBuffer
		
		super.init()
		
		let notificationKeycodeName = Notification.Name(rawValue: "GetKeycodeNotification")
	NotificationCenter.default.addObserver(self,selector:#selector(processKeycodeEvent(notification:)),name: notificationKeycodeName, object: nil)
		
		let notificationCharName = Notification.Name(rawValue: "GetCharacterNotification")
		
		NotificationCenter.default.addObserver(self,selector:#selector(processCharacterEvent(notification:)),name: notificationCharName, object: nil)
		
		let trie = Trie.builder()
			.removeOverlaps()
			.add(keyword: "hot")
			.add(keyword: "hot chocolate")
			.build()
		let emits = trie.parse(text: "hot chocolate")
		for i in ((0)...emits.count).reversed(){
			print(emits[i].keyword)
		}
		
		
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
	}
	
	func processCharacterEvent(notification: Notification) {
		let char : Character? = buffer.getChar()
		if char == nil {
			return
		}
		
	}
}
