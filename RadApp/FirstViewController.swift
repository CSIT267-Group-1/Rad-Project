//
//  FirstViewController.swift
//  RadApp
//
//  Created by Koby Samuel on 11/30/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var modelSeg: UISegmentedControl!
    
    @IBAction func determineQuiz(sender: AnyObject) {
        let segSelection: Int = modelSeg.selectedSegmentIndex
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        switch (segSelection)
        {
        case 0:
            let editorVC = mainStoryBoard.instantiateViewControllerWithIdentifier("QuizAP")
            editorVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            presentViewController(editorVC, animated: true, completion: nil)
        default:
            print("Failed to start quiz")
        }
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

