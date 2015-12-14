//
//  FirstViewController.swift
//  RadApp
//
//  Created by Koby Samuel on 11/30/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var labelToggle: UISwitch!
    @IBOutlet var modelSeg: UISegmentedControl!
	var firstName: String!
	var lastName: String!
	var studentID: Int!
	var loginViewController: LoginViewController = LoginViewController(nibName: nil, bundle: nil)
	var didFinishLogin: Bool = false
	
    
    // Tesing login =. DELETE WHEN DONE***********
    @IBAction func testingLogin(sender: AnyObject) {
        pleaseLogin()
    }
    
	//changes picture in imageview on main screen
	@IBAction func changePicture(sender: AnyObject) {
		let segSelection: Int = modelSeg.selectedSegmentIndex
		switch (segSelection)
		{
		case 0:
			if(labelToggle.on) {
				imageView.image = UIImage(named: "apenemalabels.jpg")
			}
			else {
				imageView.image = UIImage(named: "apenema.jpg")
			}
		case 1:
			if(labelToggle.on) {
				imageView.image = UIImage(named: "paenemalabels.jpg")
			}
			else {
				imageView.image = UIImage(named: "paenema.jpg")
			}
		case 2:
			if(labelToggle.on) {
				imageView.image = UIImage(named: "lldenemalabels.jpg")
			}
			else {
				imageView.image = UIImage(named: "lldenema.jpg")
			}
		case 3:
			if(labelToggle.on) {
				imageView.image = UIImage(named: "rldenemalabels.jpg")
			}
			else {
				imageView.image = UIImage(named: "rldenema.jpg")
			}
		default:
			NSLog("Failed to start quiz")
		}

	}
	
	//determines quiz to call via segment control's currently selected index
	func quizCaller() {
		let segSelection: Int = modelSeg.selectedSegmentIndex
		let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		
		switch (segSelection)
		{
		case 0:
			let editorVC = mainStoryBoard.instantiateViewControllerWithIdentifier("QuizAP")
			editorVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
			presentViewController(editorVC, animated: true, completion: nil)
		case 1:
			let editorVC = mainStoryBoard.instantiateViewControllerWithIdentifier("QuizPA")
			editorVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
			presentViewController(editorVC, animated: true, completion: nil)
		case 2:
			let editorVC = mainStoryBoard.instantiateViewControllerWithIdentifier("QuizLLD")
			editorVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
			presentViewController(editorVC, animated: true, completion: nil)
		case 3:
			let editorVC = mainStoryBoard.instantiateViewControllerWithIdentifier("QuizRLD")
			editorVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
			presentViewController(editorVC, animated: true, completion: nil)
		default:
			print("Failed to start quiz")
		}
	}
	
	//confirms user would like to take quiz
    @IBAction func determineQuiz(sender: AnyObject) {
		let alertController = UIAlertController(title: "Please confirm", message: "Are you sure you want to take this quiz? You can't leave the quiz once you start.", preferredStyle: UIAlertControllerStyle.Alert)
		let yesAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction) in
				self.quizCaller()
			})
		let noAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil)
		alertController.addAction(yesAction)
		alertController.addAction(noAction)
		presentViewController(alertController, animated: true, completion: nil)
    }
	
	func pleaseLogin() {
		let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = mainStoryBoard.instantiateViewControllerWithIdentifier("Login")
		loginVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet
		presentViewController(loginVC, animated: true, completion: nil)
		didFinishLogin = loginViewController.checkLogin()
		//transfer to view controller for login
		/*//alert for login
		let alertController = UIAlertController(title: "Please login", message: "Please enter the appropriate information", preferredStyle: UIAlertControllerStyle.Alert)
		alertController.addTextFieldWithConfigurationHandler({(firstNameField: UITextField!) in
			firstNameField.placeholder = "First name"
		})
		alertController.addTextFieldWithConfigurationHandler({(lastNameField: UITextField!) in
			lastNameField.placeholder = "Last name"
		})
		alertController.addTextFieldWithConfigurationHandler({(studentIDField: UITextField!) in
			studentIDField.placeholder = "Student ID #"
			studentIDField.keyboardType = UIKeyboardType.PhonePad
		})
		alertController.addAction(UIAlertAction(title: "Submit", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
			if(alertController.textFields![0].text! == "" || alertController.textFields![1].text! == "" || alertController.textFields![2].text! == "") {
				let errorController = UIAlertController(title: "Error!", message: "Please enter your information in every field", preferredStyle: UIAlertControllerStyle.Alert)
				errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
				self.presentViewController(errorController, animated: true, completion: nil)
			}
			else {
				self.firstName = alertController.textFields![0].text! as String
				self.lastName = alertController.textFields![1].text! as String
				if(Int(alertController.textFields![2].text!) == nil) {
					let errorController = UIAlertController(title: "Error!", message: "Please enter only numbers in the \"Student ID #\" field", preferredStyle: UIAlertControllerStyle.Alert)
					errorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
					self.presentViewController(errorController, animated: true, completion: nil)
				}
				else {
					self.studentID = Int(alertController.textFields![2].text! as String)!
				}
				self.didFinishLogin = true
			}
		}))
		self.presentViewController(alertController, animated: true, completion: nil)*/
	}
	
	override func viewDidAppear(animated: Bool) {
		/*if(!didFinishLogin) {
			didFinishLogin = loginViewController.checkLogin()
		}*/
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		changePicture(self)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

