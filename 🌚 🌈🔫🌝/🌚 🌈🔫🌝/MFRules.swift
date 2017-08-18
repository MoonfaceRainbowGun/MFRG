//
//  MFRuleList.swift
//  🌚 🌈🔫🌝
//
//  Created by Richthofen on 18/08/2017.
//  Copyright © 2017 MFRG. All rights reserved.
//

import Foundation

class Rules {
    var list = [Rule]()
    
    func getRule(_ inputSource: RuleInput) -> Rule? {
        return list.filter{$0.input == inputSource}[0]
    }
    
}
