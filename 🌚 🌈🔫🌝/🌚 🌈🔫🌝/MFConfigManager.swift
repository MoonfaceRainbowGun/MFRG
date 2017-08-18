//
//  MFConfigManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class MFConfigManager {
    init() {
        //
        
    }
    
    func loadRule(_ ruleType: String) -> Rule? {
        guard ruleType != "" else {
            return nil
        }
        
        guard let ruleFileURL = Bundle.main.url(forResource: "sample-config", withExtension: "plist") else {
            return nil
        }
        
        let ruleFileList = getRuleFileList(fileURL: ruleFileURL)
        return Rule(plist: ruleFileList)
    }
    
//    func saveRule(rule: Rule, newRuleName: String) -> String {
//        
//        let dictionary = NSMutableDictionary()
//        dictionary.setDictionary(rule.toPList())
//        let isSaved = dictionary.write(to: ruleFileURL, atomically: true)
//        
//        if(isSaved){
//            return "save succeeded"
//        }else{
//            return "save failed"
//        }
//    }
    
    func getRuleFileList(fileURL: URL) -> [String: [[String: [String: String]]]] {
        var ruleFileList = [String: [[String: [String: String]]]]()
        
        guard let configFileListDictionary = NSDictionary(contentsOf: fileURL) as? [String: AnyObject] else {
            return ruleFileList
        }
        
        ruleFileList = configFileListDictionary as! [String: [[String: [String: String]]]]
        
        return ruleFileList
    }
    
}
