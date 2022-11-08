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
        registerDefaults()
        handleFirstTime()
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
                sortChecklist()
            } catch {
                print("Error decoding list array: \(error.localizedDescription)")
            }
        }
    }
    
    func registerDefaults() {
        let dictionary = [
            "ChecklistIndex": -1,
            "FirstTime": true] as [String: Any]
        UserDefaults.standard.register(defaults: dictionary)
        
    }
    
    func handleFirstTime(){
        let userDefaults = UserDefaults.standard
        let firtsTime = userDefaults.bool(forKey: "FirstTime")
        
        if firtsTime {
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
        }
        
    }
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
        }
    }
    
    
    func sortChecklist() {
        lists.sort { list1, list2 in
            return list1.name.localizedStandardCompare(list2.name) == .orderedAscending
        }
    }
    
}
