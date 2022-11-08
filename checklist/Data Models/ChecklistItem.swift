//
//  ChecklistItem.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 20/10/22.
//

import Foundation

class ChecklistItem : NSObject, Codable {
    var text = ""
    var checked = false
    
    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
        super.init()
    }
}
