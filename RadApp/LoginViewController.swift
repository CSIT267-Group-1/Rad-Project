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
	var firstName: String!
	var lastName: String!
	var studentID: Int!

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
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
		if(firstNameField == nil || lastNameField == nil || studentIDField == nil) {
			let errorController = UIAlertController(title: "Error!", message: "Please enter your information in every field", preferredStyle: UIAlertControllerStyle.Alert)
			errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
			self.presentViewController(errorController, animated: true, completion: nil)
		}
		else {
			self.firstName = firstNameField.text! as String
			self.lastName = lastNameField.text! as String
			if(Int(studentIDField.text!) == nil) {
				let errorController = UIAlertController(title: "Error!", message: "Please enter only numbers in the \"Student ID #\" field", preferredStyle: UIAlertControllerStyle.Alert)
				errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
				self.presentViewController(errorController, animated: true, completion: nil)
			}
			else {
				self.studentID = Int(studentIDField.text! as String)!
			}
			return true
		}
		return false
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBAction func dismiss(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
