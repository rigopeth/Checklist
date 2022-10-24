//
//  AddItemTableViewController.swift
//  checklist
//
//  Created by Rigoberto Dominguez Garcia on 21/10/22.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: Actions
    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(){
        navigationController?.popViewController(animated: true)
    }

}
