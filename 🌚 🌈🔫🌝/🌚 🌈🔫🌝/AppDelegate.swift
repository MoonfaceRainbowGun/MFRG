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
        
        let themeItem = NSMenuItem()
        themeItem.title = "Theme"
        let themeMenu = NSMenu()
        themeMenu.addItem(NSMenuItem(title: "Blue Switch", action: #selector(themeDidSelect(sender:)), keyEquivalent: "1"))
        themeMenu.addItem(NSMenuItem(title: "Brown Switch", action: #selector(themeDidSelect(sender:)), keyEquivalent: "2"))
        
        
        themeItem.submenu = themeMenu
        
        
        menu.addItem(themeItem)
        
        let quit = NSMenuItem(title: "Quit", action: #selector(terminateApplication), keyEquivalent: "Q")
        menu.addItem(quit)
        
        
        
        statusItem.menu = menu
        
        
        
        MFKeyboardEventManager.sharedInstance.startListening()
        MFCharacterEventManager.sharedInstance.startListening()
		let mainBuffer : MFBuffer = MFBuffer()
        
        MFOutputManager.sharedInstance.prepareOutput(type: .mechanicKeyboardSound, userInfos: [["filename": "keyboard1.wav"]])
		let rule = Config.configManager.loadRule("keyCode")
		mainProcesser = MFProcessor(keyEventBuffer: mainBuffer, rule: rule!)
		
		
//        Config.testConfig()
        Config.testReadConfig()
    }

    func themeDidSelect(sender: Any) {
        print(sender)
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
