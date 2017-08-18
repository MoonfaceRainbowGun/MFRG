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
    var themeMenu: NSMenu!
    let configs = ["", "", ""]
    let titles = ["Synthesised Sound", "Mechanical Keyboard", "Easter Eggs"]
    var selected = [false, false, false]

	
    func applicationWillFinishLaunching(_ notification: Notification) {
        self.configureMenu()

		MFKeyboardEventManager.sharedInstance.startListening()
		MFCharacterEventManager.sharedInstance.startListening()
		let mainBuffer : MFBuffer = MFBuffer()
		
		let rule = Rule(plistName: "default-config")
		mainProcesser = MFProcessor(keyEventBuffer: mainBuffer, rule: rule)
    }
    
    func configureMenu() {
        if let button = statusItem.button {
            button.image = NSImage(named: "ic_keyboard")
        }
        
        let menu = NSMenu()
        
        menu.addItem(self.getThemeMenuItem())
        menu.addItem(self.getQuitMenuItem())

        statusItem.menu = menu
    }
    
    func getQuitMenuItem() -> NSMenuItem {
        let quit = NSMenuItem(title: "Quit", action: #selector(terminateApplication), keyEquivalent: "Q")
        return quit;
    }
    
    func getThemeMenuItem() -> NSMenuItem {
        let themeItem = NSMenuItem()
        themeItem.title = "Theme"
        
        let themeMenu = NSMenu()
        
        for (index, title) in titles.enumerated() {
            let item = NSMenuItem(title: title, action: #selector(themeDidSelect(sender:)), keyEquivalent: "\(index + 1)")
            item.tag = index;
            themeMenu.addItem(item)
        }
        
        themeItem.submenu = themeMenu
		
        self.themeMenu = themeMenu
        return themeItem;
    }

    func themeDidSelect(sender: NSMenuItem) {
        for menuItem in self.themeMenu.items {
            if menuItem == sender {
                self.selected[menuItem.tag] = !self.selected[menuItem.tag]
                menuItem.state = self.selected[menuItem.tag] ? NSOnState : NSOffState
            }
        }
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
