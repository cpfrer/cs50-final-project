//
//  ViewController.swift
//  ToDo2
//
//  Created by SOM Media Center on 12/8/17.
//  Copyright © 2017 SOM Media Center. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = [String]()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var TableView: UITableView!
    @IBAction func AddBtn(_ sender: Any) {
        if textField.text != "" {
            array.append(textField.text!)
            TableView.reloadData()
            textField.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            array.remove(at: indexPath.row)
            TableView.reloadData()
        }
    }

}

