//
//  MFConfigManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class MFConfigManager {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func loadRules(_ ruleName: String) -> Rules? {
        guard ruleName != "" else {
            return nil
        }
        
        let fileUrl = DocumentsDirectory.appendingPathComponent(ruleName)
        return NSKeyedUnarchiver.unarchiveObject(withFile: fileUrl.path) as? Rules
    }
    
    static func saveRules(_ ruleName: String, rules: Rules) -> Bool {
        let fileUrl = DocumentsDirectory.appendingPathComponent(ruleName)
        return NSKeyedArchiver.archiveRootObject(rules, toFile: fileUrl.path)
    }
}
