//
//  SecondViewController.swift
//  test2
//
//  Created by macboy on 7/12/16.
//  Copyright © 2016 XTC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let data:[String] = ["Big City FC ::Red","Big City FC ::Blue","True Soccer Campus"]
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SiteCell
            cell.label.text = data[indexPath.row]
       
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return data.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

}
