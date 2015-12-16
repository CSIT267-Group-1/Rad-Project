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
    @IBOutlet var userNameLabel: UILabel!
    
    
    
	//var loginViewController: LoginViewController = LoginViewController(nibName: nil, bundle: nil)
	var didFinishLogin: Bool = false
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // Tesing login =. DELETE WHEN DONE***********
    @IBAction func testingLogin(sender: AnyObject) {
        pleaseLogin()
    }
    
    @IBAction func signOut(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Change User", message: "Would you like to change user?", preferredStyle: UIAlertControllerStyle.Alert)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction) in
            
            self.appDelegate.firstName=nil
            self.appDelegate.lastName=nil
            self.appDelegate.studentID=nil
            
            self.userNameLabel.text="Jon Snow"
            self.pleaseLogin()
        })
        let noAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        presentViewController(alertController, animated: true, completion: nil)
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
	}
	
	override func viewDidAppear(animated: Bool) {
        pleaseLogin()
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

