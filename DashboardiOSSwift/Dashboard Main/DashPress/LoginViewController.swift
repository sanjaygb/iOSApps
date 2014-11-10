
//
//  LoginViewController.swift
//  DashPress
//
//  Created by My App Templates Team on 23/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var contentScroll: UIScrollView!
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("willShowKeyBoard:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("willHideKeyBoard:"), name:UIKeyboardWillHideNotification, object: nil)
        txtUsername.setValue(UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1), forKeyPath: "_placeholderLabel.textColor")
        txtPassword.setValue(UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1), forKeyPath: "_placeholderLabel.textColor")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willShowKeyBoard(notification : NSNotification){
        
        contentScroll.setContentOffset(CGPointMake(0, 120), animated: true);
    }
    
    func willHideKeyBoard(notification : NSNotification){
        
        contentScroll.setContentOffset(CGPointMake(0, 0), animated: true);
    }
    
    func textFieldShouldReturn (textField: UITextField!) -> Bool{
        if ((textField == txtUsername)){
            txtPassword.becomeFirstResponder();
        } else if (textField == txtPassword){
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func loginSuccessful() {
        var appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.loginSuccessful()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
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
