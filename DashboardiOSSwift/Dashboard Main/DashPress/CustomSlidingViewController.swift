//
//  CustomSlidingViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 08/10/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class CustomSlidingViewController: ECSlidingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
//        if (appDelegate.shouldRotate == 0) {
//            return 0
//        } else {
//            return 1
//        }
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if (appDelegate.shouldRotate == 0) {
            return Int(UIInterfaceOrientationMask.Portrait.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
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
