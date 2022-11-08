//
//  Checklist.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 01/11/22.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var name = ""
    
    var iconName = "No Icon"
    
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems () -> Int {
        /*var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count*/
        
        
        //That’s quite a bit of code for something that’s fairly simple. You
        // can actually write this in a single line of code:
        
        // Functional Programming
        
        return items.reduce(0) {
            cnt,item in cnt + (item.checked ? 0 : 1)
        }
    }
    
}
