//
//  SalesViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 23/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class SalesViewController: UIViewController{

    var items : NSMutableArray! = NSMutableArray()
    var itemHeading: NSMutableArray! = NSMutableArray()
    @IBOutlet var tblSales :UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addItems() {
        items.addObject(["sale":"icon-sale", "paypal":"Paypal", "time":"2:12pm", "name":"Juan Carlos", "orderNumber":"Order number 7348273", "new":"icon-new", "amount":"+$69.99"])
        items.addObject(["sale":"icon-sale", "paypal":"2CO", "time":"1:23pm", "name":"David Person", "orderNumber":"Order number 7348273", "new":"icon-new", "amount":"+$1023.99"])
        items.addObject(["sale":"icon-refund", "paypal":"Stripe", "time":"2:12pm", "name":"Juan Carlos", "orderNumber":"Order number 7348273", "new":"None", "amount":"+$69.99"])
        
        itemHeading.addObject("Today 23 September 2014")
        itemHeading.addObject("24 September 2014")
        itemHeading.addObject("25 September 2014")
        itemHeading.addObject("26 September 2014")
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return itemHeading.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view: UIView! = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 40))
        view.backgroundColor = UIColor(red: 236.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1)
        var lblHeading : UILabel! = UILabel(frame: CGRectMake(20, 0, 200, 20))
        lblHeading.font = UIFont.systemFontOfSize(12)
        lblHeading.textColor = UIColor.darkGrayColor()
        lblHeading.text = itemHeading.objectAtIndex(section) as NSString
        view.addSubview(lblHeading)
        return view
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell : SalesFeedTableViewCell!
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        cell = tblSales.dequeueReusableCellWithIdentifier("SalesFeedCell") as SalesFeedTableViewCell
        cell.imgSale.image = UIImage(named: itemDic["sale"]!)
        cell.lblPaypal.text = itemDic["paypal"]
        cell.lblTime.text = itemDic["time"]
        cell.lblName.text = itemDic["name"]
        cell.lblOrderNumber.text = itemDic["orderNumber"]
        var newImg = itemDic["new"] as NSString!
        if (!newImg.isEqualToString("None")) {
            cell.imgNew.image = UIImage(named: newImg)
            cell.lblAmount.textColor = UIColor.darkGrayColor()
        } else {
            cell.lblAmount.textColor = UIColor.blackColor()
        }
        cell.lblAmount.text = itemDic["amount"]
        return cell;
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        self.performSegueWithIdentifier("pushToDetail", sender: nil)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    //pushToDetail

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
