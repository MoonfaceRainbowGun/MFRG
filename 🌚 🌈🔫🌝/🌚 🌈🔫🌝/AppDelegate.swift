//
//  AppDelegate.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	var mainProcesser : MFProcessor?
	
    func applicationWillFinishLaunching(_ notification: Notification) {
        MFKeyboardEventManager.sharedInstance.startListening();
        MFCharacterEventManager.sharedInstance.startListening();
		let mainBuffer : MFBuffer = MFBuffer()
		mainProcesser = MFProcessor(keyEventBuffer : mainBuffer)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
