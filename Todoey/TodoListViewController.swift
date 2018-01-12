//
//  ViewController.swift
//  Todoey
//
//  Created by Anup DSouza on 12/01/18.
//  Copyright © 2018 Anup DSouza. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["item 1", "item 2", "item 3"]
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = userDefaults.array(forKey: "TodoList") as? [String] {
            itemArray = items
        }
    }

    // MARK - Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK - Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var alertTextfield = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            self.itemArray.append(alertTextfield.text!)
            
            self.userDefaults.setValue(self.itemArray, forKey: "TodoList")
            self.userDefaults.synchronize()
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "item name"
            alertTextfield = textfield
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

