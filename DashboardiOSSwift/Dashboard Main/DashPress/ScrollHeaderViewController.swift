//
//  ScrollHeaderViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 10/5/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class ScrollHeaderViewController: UIViewController {

    @IBOutlet var topScroll : UIScrollView!
    @IBOutlet var contentScroll : UIScrollView!
    @IBOutlet var rangeView :UIView!
    @IBOutlet var dateRangeLbl : UILabel!
    @IBOutlet var calenderView : DSLCalendarView!
    @IBOutlet var calenderHolder : UIView!
    @IBOutlet var doneBtn : UIBarButtonItem!

    var isRangeOpen : Int8! = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showCalender(sender:AnyObject) {
        self.hideRangeView(sender)
        self.calenderHolder.frame = CGRectMake(self.calenderHolder.frame.origin.x, self.calenderHolder.frame.origin.y, 320, 0);
        self.calenderHolder.hidden = false
        self.navigationItem.rightBarButtonItem = doneBtn;
        UIView.animateWithDuration(0.25, delay: 0, options:nil, animations: {
            self.calenderHolder.frame = CGRectMake(self.calenderHolder.frame.origin.x, self.calenderHolder.frame.origin.y, 320, self.view.frame.size.height - self.calenderHolder.frame.origin.y);
            }, completion: nil)
    }

    @IBAction func hideCalender() {
        self.navigationItem.rightBarButtonItem = nil
        UIView.animateWithDuration(0.25, delay: 0 , options:nil, animations: {
            self.calenderHolder.frame = CGRectMake(self.calenderHolder.frame.origin.x, self.calenderHolder.frame.origin.y, 320, 0);
            
            }, completion: {
                ( value :Bool ) in
                self.calenderHolder.hidden = true
        })
    }

    @IBAction func showRangeView(sender: AnyObject) {
        
        if isRangeOpen == 1 {
            self.hideRangeView(sender)
        } else {
            isRangeOpen = 1
            self.rangeView.frame = CGRectMake(self.rangeView.frame.origin.x, self.rangeView.frame.origin.y, 320, 0);
            self.rangeView.hidden = false
            UIView.animateWithDuration(0.25, delay: 0, options:nil, animations: {
                self.rangeView.frame = CGRectMake(self.rangeView.frame.origin.x, self.rangeView.frame.origin.y, 320, 350);
                }, completion: nil)

        }
    }

    @IBAction func hideRangeView(sender: AnyObject) {
        var button : UIButton = sender as UIButton
        if (button.tag > 1) {
            self.topScroll.setContentOffset(CGPointMake(CGFloat(160 * (button.tag - 1)), 0), animated: true)
            self.contentScroll.setContentOffset(CGPointMake(CGFloat(320 * (button.tag - 1)), 0), animated: true)
        } else if (button.tag == 1) {
            self.topScroll.setContentOffset(CGPointMake(0, 0), animated: true)
            self.contentScroll.setContentOffset(CGPointMake(0, 0), animated: true)
        }
        
        if (isRangeOpen == 1 ) {
            UIView.animateWithDuration(0.25, delay: 0, options:nil, animations: {

                self.rangeView.frame = CGRectMake(self.rangeView.frame.origin.x, self.rangeView.frame.origin.y, 320, 0);
                }, completion:{
                    ( value :Bool ) in
                    self.rangeView.hidden = true
            })
            isRangeOpen = 0
        }
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
