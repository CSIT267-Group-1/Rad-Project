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
    var currentSelectedQuestionIndex: Int = -1 // stores the current question location from the array
    
    @IBOutlet var hepFelx: UIButton!
    @IBOutlet var tranCol: UIButton!
    @IBOutlet var spleFlex: UIButton!
    @IBOutlet var sigmoid: UIButton!
    @IBOutlet var descCol: UIButton!
    @IBOutlet var ascCol: UIButton!
    
    var questions: [String: UIButton]!
    
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
        
        //displayRandomQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createQuestions()
    {
        questions =
        [
            "What is the location of the splenic flexure on a PA view of a barium enema?": spleFlex,
            "What is the location of the hepatic flexure on a PA view of a barium enema?": hepFelx,
            "What is the location of the descending colon on a PA view of a barium enema?": descCol,
            "What is the location of the ascending colon on a PA view of a barium enema?": ascCol,
            "What is the location of the transverse colon on a PA view of a barium enema?": tranCol,
            "In a PA view of a barium enema, Is the transverse colon filled with ______________?": UIButton(),
            "In a PA axial oblique (RAO) projection of a barium enema view, what is the anatomy that is being best demonstrated?": UIButton(),
            "In a PA axial projection of a barium enema view, what is the anatomy that is being best demonstrated?": UIButton()
        ]
    }
    
    func displayRandomQuestion()
    {
        for var count = 0; count < questions.count; count++
        {
            
        }
    }

}
