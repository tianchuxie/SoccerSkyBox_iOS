//
//  TeamSite.swift
//  test2
//
//  Created by macboy on 7/12/16.
//  Copyright © 2016 XTC. All rights reserved.
//

import UIKit

class TeamSite: UIViewController  {

    @IBOutlet weak var tableview: UITableView!
    let titles = ["Home", "Schedule", "Roster", "Contacts", "Messages"]
    let imageArray = [UIImage(named: "Phome"), UIImage(named: "Pscheule"), UIImage(named: "Proster"), UIImage(named: "Ptarget"), UIImage(named: "Pmessage")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TeamSiteViewCell
        cell.title?.text = titles[indexPath.row]
        cell.iconImg?.image = imageArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showView", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showView")
        {
            let vc = segue.destinationViewController as! Schedule
            
            let indexPath = self.tableview!.indexPathForSelectedRow!
            
            
            
            
            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
        }
        
        
        
        
    }
    
    
    
    
    
    
    
}
