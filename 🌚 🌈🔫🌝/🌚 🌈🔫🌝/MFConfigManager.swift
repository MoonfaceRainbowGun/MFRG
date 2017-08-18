//
//  MFConfigManager.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class MFConfigManager {
    fileprivate var urls: [URL] = []
    fileprivate var documentDirectory: URL
    fileprivate var ruleFileURL: URL
    
    init() {
        urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        documentDirectory = urls[0]
//        ruleFileURL = documentDirectory.appendingPathComponent("config.pList")
        ruleFileURL = URL(fileURLWithPath: "/Users/ljq/Desktop/hahahahah.plist")
    }
    
    func loadRule(_ ruleType: String) -> Rule? {
        guard ruleType != "" else {
            return nil
        }
        
        let ruleFileList = getRuleFileList()
        
        return Rule(plist: ruleFileList)
    }
    
    func saveRule(rule: Rule, newRuleName: String) -> String {
        
        let dictionary = NSMutableDictionary()
        dictionary.setDictionary(rule.toPList())
        let isSaved = dictionary.write(to: ruleFileURL, atomically: true)
        
        if(isSaved){
            return "save succeeded"
        }else{
            return "save failed"
        }
    }

    
    func getRuleFileNameList() -> [String] {
        return Array(getRuleFileList().keys)
    }
    
    func getRuleFileList() -> [String: [[String: [String: String]]]] {
        var ruleFileList = [String: [[String: [String: String]]]]()
        
        guard let configFileListDictionary = NSDictionary(contentsOf: ruleFileURL) as? [String: AnyObject] else {
            return ruleFileList
        }
        
        ruleFileList = configFileListDictionary as! [String: [[String: [String: String]]]]
        
        return ruleFileList
    }
    
}
