//
//  MainViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 21/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tblItems : UITableView!
    var items : NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populateArray()
        // Do any additional setup after loading the view.
    }
    
    func populateArray() {
        self.addItem("icon-menu-my-account-normal", withTitle:"Dashboard", andSegue:"MyAccount", selectedIcon:"icon-menu-my-account-selected")
        self.addItem("icon-menu-feed-normal", withTitle:"Feed", andSegue:"Feed", selectedIcon:"icon-menu-feed-selected")
        self.addItem("icon-menu-add-account-normal", withTitle:"Add Account", andSegue:"None", selectedIcon:"icon-menu-add-account-selected")
        self.addItem("icon-menu-setting-normal", withTitle:"Access Settings", andSegue:"None", selectedIcon:"icon-menu-setting-selected")
        self.addItem("icon-menu-about-normal", withTitle:"About", andSegue:"None", selectedIcon:"icon-menu-about-selected")
        self.addItem("icon-menu-help-normal", withTitle:"Help", andSegue:"None", selectedIcon:"icon-menu-help-selected")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItem(icon:String, withTitle title:String, andSegue segue:String, selectedIcon selIcon:String) {
        items.addObject(["icon":icon, "title":title, "segue":segue, "selectedIcon":selIcon])
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell : LoginTableViewCell!
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        var icon = itemDic["icon"] as NSString!
        var title = itemDic["title"] as NSString!
        
        cell = tblItems.dequeueReusableCellWithIdentifier("MenuItemCell") as LoginTableViewCell
        cell.itemImg.image = UIImage(named: icon)
        cell.itemTitle.text = title
        
        if (indexPath.row == 0) {
            cell.contentView.backgroundColor = UIColor(red: 1.0/255.0, green: 182.0/255.0, blue: 202.0/255.0, alpha: 1)
            var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
            var icon = itemDic["selectedIcon"] as NSString!
            var segue = itemDic["segue"] as NSString!
            cell.itemTitle.textColor = UIColor.whiteColor()
            cell.itemImg.image = UIImage(named: icon)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
        var indexP :NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        var cell1 : LoginTableViewCell! = tblItems.cellForRowAtIndexPath(indexP) as LoginTableViewCell
        self.deselectCell(cell1, indexP: indexP)
        
        var cell : LoginTableViewCell! = tblItems.cellForRowAtIndexPath(indexPath) as LoginTableViewCell
        cell.contentView.backgroundColor = UIColor(red: 1.0/255.0, green: 182.0/255.0, blue: 202.0/255.0, alpha: 1)
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        var icon = itemDic["selectedIcon"] as NSString!
        var segue = itemDic["segue"] as NSString!
        cell.itemTitle.textColor = UIColor.whiteColor()
        cell.itemImg.image = UIImage(named: icon)
        if (!segue.isEqualToString("None")) {
            self.performSegueWithIdentifier(segue, sender: nil)
        }
    }
    
    func deselectCell(cell:LoginTableViewCell, indexP indexPath:NSIndexPath) {
        cell.contentView.backgroundColor = UIColor.clearColor()
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        var icon = itemDic["icon"] as NSString!
        cell.itemTitle.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1)
        cell.itemImg.image = UIImage(named: icon)

    }
    
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!){
        var cell : LoginTableViewCell! = tblItems.cellForRowAtIndexPath(indexPath) as LoginTableViewCell
        self.deselectCell(cell, indexP: indexPath)
    }
    
    @IBAction func unwindToMenuViewController(segue: UIStoryboardSegue) {
       
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
