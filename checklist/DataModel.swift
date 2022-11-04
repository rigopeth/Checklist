//
//  DataModel.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 03/11/22.
//

import Foundation

class DataModel {
    
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
    }
    
    // MARK: - Data Saving
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() ->URL{
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        // 1
        let encoder = PropertyListEncoder()
        // 2
        do {
            let data = try encoder.encode(lists)
            //4
            try data.write(
                to: dataFilePath(),
                options: Data.WritingOptions.atomic)
            //5
        } catch {
            //6
            print("Error encoding list array: \(error.localizedDescription)")
        }
        
    }
    
    func loadChecklists() {
        // 1
        let path = dataFilePath()
        //2
        if let data = try? Data(contentsOf: path) {
            //3
            let decoder = PropertyListDecoder()
            do {
                //4
                lists = try decoder.decode(
                    [Checklist].self,
                    from: data)
            } catch {
                print("Error decoding list array: \(error.localizedDescription)")
            }
        }
    }
    
}
