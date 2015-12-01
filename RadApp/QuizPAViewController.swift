//
//  QuizPAViewController.swift
//  RadApp
//
//  Created by csit267-8 on 11/30/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class QuizPAViewController: UIViewController {
    
    var currentSelectedArea: UIButton!
    
    let questions: [String] =
    [
        "What is the location of the splenic flexure on a PA view of a barium enema?",
        "What is the location of the hepatic flexure on a PA view of a barium enema?",
        "What is the location of the descending colon on a PA view of a barium enema?",
        "What is the location of the ascending colon on a PA view of a barium enema?",
        "What is the location of the transverse colon on a PA view of a barium enema?",
        "In a PA view of a barium enema, Is the transverse colon filled with ______________?",
        "In a PA axial oblique (RAO) projection of a barium enema view, what is the anatomy that is being best demonstrated?",
        "In a PA axial projection of a barium enema view, what is the anatomy that is being best demonstrated?"
    ]
    
    @IBAction func locationSelected(sender: AnyObject) {
        if currentSelectedArea != nil
        {
            currentSelectedArea.backgroundColor=UIColor.clearColor()
            currentSelectedArea=(sender as! UIButton)
            currentSelectedArea.backgroundColor=UIColor.redColor()
        }
        else
        {
            currentSelectedArea=(sender as! UIButton)
            currentSelectedArea.backgroundColor=UIColor.redColor()
        }
    }

    @IBAction func dismissQuiz(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
