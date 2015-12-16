//
//  LoginViewController.swift
//  RadApp
//
//  Created by Koby Samuel on 12/9/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	@IBOutlet weak var firstNameField: UITextField!
	@IBOutlet weak var lastNameField: UITextField!
	@IBOutlet weak var studentIDField: UITextField!
	@IBOutlet weak var submitButton: UIButton!
	
    @IBAction func submit(sender: AnyObject) {
        if checkLogin()
        {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let userName: String  = "\(appDelegate.firstName) \(appDelegate.lastName)"
            
            (presentingViewController as! FirstViewController).userNameLabel.text=userName
            
            dismiss(self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func checkLogin() -> Bool {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let first = firstNameField.text!
        let last = lastNameField.text!
        let id = studentIDField.text!

		if(first == "")
        {
			let errorController = UIAlertController(title: "Error!", message: "Please enter your FIRST name.", preferredStyle: UIAlertControllerStyle.Alert)
			errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
			self.presentViewController(errorController, animated: true, completion: nil)
            
            print("No ID info entered")
            
            return false
		}
            
        if(last == "")
        {
            let errorController = UIAlertController(title: "Error!", message: "Please enter your LAST name.", preferredStyle: UIAlertControllerStyle.Alert)
            errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
            self.presentViewController(errorController, animated: true, completion: nil)
            
            print("No ID info entered")
            
            return false
        }
            
        if Int(id) == nil
        {
            let errorController = UIAlertController(title: "Error!", message: "Please enter only numbers in the \"Student ID #\" field", preferredStyle: UIAlertControllerStyle.Alert)
            errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
            self.presentViewController(errorController, animated: true, completion: nil)
            
            return false
        }
        
        appDelegate.firstName = first
        appDelegate.lastName = last
        appDelegate.studentID = Int(id)
        
        return true
	}
	
	@IBAction func dismiss(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
