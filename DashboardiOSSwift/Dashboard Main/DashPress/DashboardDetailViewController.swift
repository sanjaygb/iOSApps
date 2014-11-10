//
//  DashboardDetailViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 10/5/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class DashboardDetailViewController: ScrollHeaderViewController {

    @IBOutlet var graphView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.shouldRotate = 1
        self.topScroll.contentOffset = CGPointMake(self.topScroll.frame.size.width, 0)
        graphView.frame = CGRectMake(graphView.frame.origin.x, graphView.frame.origin.y, self.view.frame.size.height - 64, self.view.frame.size.width - 20);
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.shouldRotate = 1
    }
    
    override func viewWillDisappear(animated: Bool) {
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.shouldRotate = 0
        
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if ((fromInterfaceOrientation == UIInterfaceOrientation.Portrait) || (fromInterfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown)) {
            graphView.hidden = false
        } else {
            graphView.hidden = true
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
