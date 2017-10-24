//
//  FirstViewController.swift
//  test2
//
//  Created by macboy on 7/12/16.
//  Copyright © 2016 XTC. All rights reserved.
//

import UIKit

class FirstViewController:  UIViewController, UITableViewDataSource {
    
    let data:[String] = ["Item 1","Item 2","Item 3","Item 4","Item 5","Item 6"]
    let data1:[String] = ["Item a","Item b","Item c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        if indexPath.section == 0 {
            cell.label.text = data[indexPath.row]
        }
        else {
            cell.label.text = data1[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        }
        return data1.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "June 2016"
        }
        return "Data 1"
    }
}
