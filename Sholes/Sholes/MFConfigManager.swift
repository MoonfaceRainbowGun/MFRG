//
//  MFConfigManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class MFConfigManager {
    static let sharedInstance = MFConfigManager()
    
    func loadRule(_ ruleType: String) -> Rule? {
        guard ruleType != "" else {
            return nil
        }
        
        guard let ruleFileURL = Bundle.main.url(forResource: "default-config", withExtension: "plist") else {
            return nil
        }
        
        let ruleFileList = getRuleFileList(fileURL: ruleFileURL)
        return Rule(plist: ruleFileList)
    }
    
    func getRuleFileList(fileURL: URL) -> [String: Any] {
        guard let configFileListDictionary = NSDictionary(contentsOf: fileURL) as? [String: AnyObject] else {
            return [String: Any]()
        }
        
        return configFileListDictionary
    }
    
}
