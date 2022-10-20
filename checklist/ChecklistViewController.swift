//
//  ViewController.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 18/10/22.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 100
        }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",
            for: indexPath)
            
            /*
             First row:     0 % 5 = 0
             Second row:    1 % 5 = 1
             Third row:     2 % 5 = 2
             Fourth row:    3 % 5 = 3
             Fifth row:     4 % 5 = 4

             Sixth row:     5 % 5 = 0  (same as first row)  *** The sequence
             Seventh row:   6 % 5 = 1  (same as second row)     repeats here
             Eighth row:    7 % 5 = 2  (same as third row)
             Ninth row:     8 % 5 = 3  (same as fourth row)
             Tenth row:     9 % 5 = 4  (same as fifth row)

             Eleventh row: 10 % 5 = 0  (same as first row)  *** The sequence
             Twelfth row:  11 % 5 = 1  (same as second row)     repeats again
             and so on...
             */
            let label = cell.viewWithTag(1000) as! UILabel
            
            if indexPath.row % 5 == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row % 5 == 2 {
                label.text = "Learn iOS development"
            } else if indexPath.row % 5 == 3 {
                label.text = "Socer Practice"
            } else if indexPath.row % 5 == 4 {
                label.text = "Eat ice Cream"
            }
            
            return cell
        }
    
    // MARK: - Table View Delegate
    
    override func tableView (
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .none {
                cell.accessoryType =  .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

}

