//
//  ViewController.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 18/10/22.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    func itemDetailViewControllerdidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(
      _ controller: ItemDetailViewController,
      didFinishEditing item: ChecklistItem
    ) {
      if let index = items.firstIndex(of: item) {
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) {
          configureText(for: cell, with: item)
        }
      }
      navigationController?.popViewController(animated: true)
    }

    
    
    var items = [ChecklistItem]()  // Those square brackets indicate that the variable is going to be an array containing ChecklistItem objects. And the brackets at the end () simply indicate that you are creating an instance of this array
    
    /*var row0item = ChecklistItem()
    var row1item = ChecklistItem()
    var row2item = ChecklistItem()
    var row3item = ChecklistItem()
    var row4item = ChecklistItem()*/
    
      /*let row0text = "Walk the dog"
      let row1text = "Brush teeth"
      let row2text = "Learn iOS development"
      let row3text = "Soccer practice"
      let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = true
    var row2checked = true
    var row3checked = false
    var row4checked = true*/


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        
          /*row0item.text = "Walk the dog"

          row1item.text = "Brush my teeth"
          row1item.checked = true

          row2item.text = "Learn iOS development"
          row2item.checked = true

          row3item.text = "Soccer practice"

          row4item.text = "Eat ice cream"
          row4item.checked = true*/
        
          let item1 = ChecklistItem()
          item1.text = "Walk the dog"
          items.append(item1)

          let item2 = ChecklistItem()
          item2.text = "Brush my teeth"
          item2.checked = true
          items.append(item2)

          let item3 = ChecklistItem()
          item3.text = "Learn iOS development"
          item3.checked = true
          items.append(item3)

          let item4 = ChecklistItem()
          item4.text = "Soccer practice"
          items.append(item4)

          let item5 = ChecklistItem()
          item5.text = "Eat ice cream"
          items.append(item5)
        
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return items.count
        }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",
            for: indexPath)
            
            let item = items[indexPath.row]
            
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
            
            configureText(for: cell, with: item)
            configureCheckmark(for: cell, with: item)
            
            return cell
        }
    
    // MARK: - Table View Delegate
    
    override func tableView (
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item = items[indexPath.row]
                item.checked.toggle()

            configureCheckmark(for: cell, with:item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        //1
        items.remove(at: indexPath.row)
        
        //2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem){
            let label = cell.viewWithTag(1001) as! UILabel
            
            if(item.checked){
                label.text = "√"
            } else {
                label.text = ""
            }
        }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        
        if segue.identifier == "AddItem"{
            //2
            let controler = segue.destination as! ItemDetailViewController
            //3
            controler.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self

            if let indexPath = tableView.indexPath(
              for: sender as! UITableViewCell) {
              controller.itemToEdit = items[indexPath.row]
            }
          }
    }
    
}

