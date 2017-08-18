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
    let statusItem = NSStatusBar.system().statusItem(withLength: 40)

	
    func applicationWillFinishLaunching(_ notification: Notification) {
        
        if let button = statusItem.button {
            button.image = NSImage(named: "ic_keyboard")
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(terminateApplication), keyEquivalent: "Q"))
        statusItem.menu = menu
        
        MFKeyboardEventManager.sharedInstance.startListening()
        MFCharacterEventManager.sharedInstance.startListening()
		let mainBuffer : MFBuffer = MFBuffer()
        
        MFOutputManager.sharedInstance.prepareOutput(type: .mechanicKeyboardSound, userInfos: [["filename": "keyboard1.wav"]])
		mainProcesser = MFProcessor(keyEventBuffer: mainBuffer)
    }

    func terminateApplication() {
        exit(0)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
