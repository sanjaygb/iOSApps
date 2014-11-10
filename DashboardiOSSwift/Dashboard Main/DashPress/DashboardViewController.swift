//
//  DashboardViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 23/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class DashboardViewController: ScrollHeaderViewController, DSLCalendarViewDelegate, UIScrollViewDelegate {

    @IBOutlet var tblGraphs: UITableView!

    var items : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addItems()
        calenderView.delegate = self
        self.contentScroll.contentSize = CGSizeMake(2560, 0)
        self.contentScroll.contentOffset = CGPointMake(self.contentScroll.frame.size.width, 0);
        self.topScroll.contentOffset = CGPointMake(self.topScroll.frame.size.width/2, 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItems() {
        items.addObject(["bgImg":"graph-daily-revenue", "type":"Daily Revenue", "amount":"$226", "percent":"+13.2", "day":"Yesterday"])
        items.addObject(["bgImg":"graph-daily-sales", "type":"Daily Sales", "amount":"6", "percent":"-6.2", "day":"Yesterday"])
        items.addObject(["bgImg":"graph-payment-gateway", "type":" ", "amount":"$200", "percent":"+13.2", "day":"Yesterday"])
        items.addObject(["bgImg":"graph-daily-revenue", "type":"Daily Revenue", "amount":"$226", "percent":"+13.2", "day":"Yesterday"])
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell : DashboardTableViewCell!
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        cell = tblGraphs.dequeueReusableCellWithIdentifier("DashboardCell") as DashboardTableViewCell
        cell.bgImg.image = UIImage(named: itemDic["bgImg"]!)
        cell.lblType.text = itemDic["type"]! as String
        cell.lblAmount.text = itemDic["amount"]! as String
        cell.lblPercent.text = itemDic["percent"]! as String
        cell.lblDay.text = itemDic["day"]! as String
        return cell
    }

    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        self.performSegueWithIdentifier("DashboardDetail", sender: nil)
    }
    
   

    func calendarView(calendarView: DSLCalendarView!, didSelectRange range: DSLCalendarRange!) {
        if range != nil  {
            dateRangeLbl.text = NSString(format: "\(range.startDay.day)/\(range.startDay.month) - \(range.endDay.day)/\(range.endDay.day)");
        }
    }

    func calendarView(calendarView: DSLCalendarView!, didChangeToVisibleMonth month: NSDateComponents!) {
        
    }
    
    func calendarView(calendarView: DSLCalendarView!, shouldAnimateDragToMonth month: NSDateComponents!) -> Bool {
        return true
    }
    
    func calendarView(calendarView: DSLCalendarView!, willChangeToVisibleMonth month: NSDateComponents!, duration: NSTimeInterval) {
        
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        topScroll.setContentOffset(CGPointMake(contentScroll.contentOffset.x / 2, 0), animated: true)

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
