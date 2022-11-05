//
//  Checklist.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 01/11/22.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var name = ""
    
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
