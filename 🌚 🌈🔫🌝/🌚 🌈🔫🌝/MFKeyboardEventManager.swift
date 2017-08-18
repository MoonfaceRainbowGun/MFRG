//
//  MFKeyboardEventManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Wang Jinghan on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Cocoa

class MFKeyboardEventManager: NSObject {
    static let sharedInstance: MFKeyboardEventManager = MFKeyboardEventManager()
    fileprivate var buffers = Set<MFBuffer>()
    
    override init() {
        super.init()
    }
    
    func startListening() {
        self.listenToEvent();
    }
    
    func addBuffer(buffer: MFBuffer) {
        self.buffers.insert(buffer)
    }
    
    fileprivate func listenToEvent() {
        let eventType = 1 << CGEventType.keyDown.rawValue | 1 << CGEventType.flagsChanged.rawValue
        guard let eventTap: CFMachPort = CGEvent.tapCreate(tap: .cgSessionEventTap, place: .headInsertEventTap, options: .defaultTap, eventsOfInterest: CGEventMask(eventType), callback: didReceiveKeyboardEvent, userInfo: nil) else {
            return
        }
        
        DispatchQueue(label: "keyboard-catching-queue").async {
            let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
            CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
            CGEvent.tapEnable(tap: eventTap, enable: true)
            CFRunLoopRun()
        }
    }
    
    fileprivate func didReceiveKeyDownEvent(event: CGEvent) {
        let keyCode = event.getIntegerValueField(.keyboardEventKeycode)
        self.notifyBufferForKeyCode(keyCode: Int(keyCode))
    }
    
    fileprivate func didReceiveFlagsChangedEvent(event: CGEvent) {
        let keyCode = event.getIntegerValueField(.keyboardEventKeycode)
        self.notifyBufferForKeyCode(keyCode: Int(keyCode))
    }
    
    fileprivate func notifyBufferForKeyCode(keyCode: Int) {
        MFOutputManager.sharedInstance.executeEvent(type: .mechanicKeyboardSound, userInfo: ["filename": "keyboard1.wav"])
//        MFSynthesizer.sharedInstance.play(frequency: Float(keyCode + 35) * 20, force: 100)
        for buffer in self.buffers {
            buffer.pushKeyCode(keycode: keyCode)
        }
    }
}

var previousFlag: UInt64 = 0;
var capsOn: Bool = false;

fileprivate func didReceiveKeyboardEvent(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    
    let manager = MFKeyboardEventManager.sharedInstance;
    if type == .keyDown {
        manager.didReceiveKeyDownEvent(event: event);
    } else if type == .flagsChanged {
        print(event.flags)
        if event.flags.rawValue > previousFlag {
            manager.didReceiveFlagsChangedEvent(event: event)
        } else if capsOn {
            if event.flags.intersection(CGEventFlags.maskAlphaShift) == CGEventFlags(rawValue: 0) {
                capsOn = false;
                manager.didReceiveFlagsChangedEvent(event: event)
            }
        }
        
        if event.flags.intersection(CGEventFlags.maskAlphaShift) == CGEventFlags.maskAlphaShift {
            capsOn = true;
        }
        
        previousFlag = event.flags.rawValue
    }
    
    return Unmanaged.passRetained(event)
}
