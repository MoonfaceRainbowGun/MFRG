//
//  MFAccessManager.swift
//  Sholes
//
//  Created by Jinghan Wang on 27/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFAccessManager: NSObject {
	static let sharedInstance = MFAccessManager()
	
	func checkAccess() -> Bool{
		let checkOptionPrompt = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString
		let options = [checkOptionPrompt: true]
		let accessEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary?)
		
		return accessEnabled
	}

}
