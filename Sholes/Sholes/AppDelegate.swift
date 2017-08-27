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

    let statusItem = NSStatusBar.system().statusItem(withLength: 40)
    var themeMenu: NSMenu!

    let configs = ["mechanical-keyboard", "pentatonic", "easter-eggs", "midi", "git", "voice", "command-line", "xwlb"]
	var selected = [String: Bool]()

    var processors = [String: MFProcessor]()

	
    func applicationWillFinishLaunching(_ notification: Notification) {
		
        self.retrieveUserSettings()
		
        self.configureMenu()

		MFKeyboardEventManager.sharedInstance.startListening()
		MFCharacterEventManager.sharedInstance.startListening()
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
        
        for (index, plistName) in configs.enumerated() {
			let rule = Rule(plistName: plistName)
            let item = MFMenuItem(title: rule.displayName, action: #selector(themeDidSelect(sender:)), keyEquivalent: "\(index + 1)")
			item.userInfo["plist"] = plistName;
            themeMenu.addItem(item)
			
			let selected = self.selected[plistName] != nil && self.selected[plistName]!
			
            if selected {
                item.state = NSOnState
                let processor = MFProcessor(keyEventBuffer: MFBuffer(), rule: rule)
                self.processors[plistName] = processor
            }
        }
        
        themeItem.submenu = themeMenu
		
        self.themeMenu = themeMenu
        return themeItem;
    }

    func themeDidSelect(sender: NSMenuItem) {
		
		defer {
			self.saveUserSettings()
		}
		
        for menuItem in self.themeMenu.items {
            if menuItem == sender, let item = sender as? MFMenuItem {
				let plistName = item.userInfo["plist"] as! String;
				let selected = !(self.selected[plistName] != nil && self.selected[plistName]!)
                self.selected[plistName] = selected
                if (selected) {
                    let rule = Rule(plistName: plistName)
                    let processor = MFProcessor(keyEventBuffer: MFBuffer(), rule: rule)
                    self.processors[plistName] = processor
					menuItem.state = NSOnState
                } else {
                    self.processors[plistName] = nil
					menuItem.state = NSOffState
                }
            }
        }
    }
    
    func saveUserSettings() {
        UserDefaults.standard.set(self.selected, forKey: "record");
    }
    
    func retrieveUserSettings() {
		if let record = UserDefaults.standard.dictionary(forKey: "record") as? [String: Bool] {
            self.selected = record
        }
    }
    
    func terminateApplication() {
        exit(0)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }


}
