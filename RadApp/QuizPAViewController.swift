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
    @IBOutlet var question: UILabel!
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var submit: UIButton!
    @IBOutlet var multipleChoiceButtonA: UIButton!
    @IBOutlet var multipleChoiceButtonB: UIButton!
    @IBOutlet var multipleChoiceButtonC: UIButton!
    @IBOutlet var multipleChoiceButtonD: UIButton!
    @IBOutlet var multipleChoiceView: UIStackView!
    
    var questions: [Quiz] = [Quiz]()
    
    @IBAction func locationSelected(sender: AnyObject) {
        
        // sets the setelced location to so the user can see where they clicked. 
        // Also removes any other current selection
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
        
        createQuestions()
        displayQuestion(7)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createQuestions()
    {
        var multipleChoiceArray: [String] // used to store multiple choice buton titles

        questions.append(Quiz(question: "What is the location of the splenic flexure on a PA view of a barium enema?", hasMultipleChoice: false, correctButton: spleFlex, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the hepatic flexure on a PA view of a barium enema?", hasMultipleChoice: false, correctButton: hepFelx, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the descending colon on a PA view of a barium enema?", hasMultipleChoice: false, correctButton: descCol, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the ascending colon on a PA view of a barium enema?", hasMultipleChoice: false, correctButton: ascCol, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the transverse colon on a PA view of a barium enema?", hasMultipleChoice: false, correctButton: tranCol, buttonArray: nil))
        
        multipleChoiceArray = ["Air", "Barium", "Both air and Barium", "Nothing"]
        questions.append(Quiz(question: "In a PA view of a barium enema, Is the transverse colon filled with ______________?", hasMultipleChoice: true, correctButton: multipleChoiceButtonB, buttonArray: multipleChoiceArray))
        
        multipleChoiceArray = ["Ascending Colon", "Descending Colon", "Sigmoid Colon", "Transverse Colon"]
        questions.append(Quiz(question: "In a PA axial oblique (RAO) projection of a barium enema view, what is the anatomy that is being best demonstrated?", hasMultipleChoice: true, correctButton: multipleChoiceButtonC, buttonArray: multipleChoiceArray))
        
        multipleChoiceArray = ["Ascending Colon", "Descending Colon", "Sigmoid Colon", "Transverse Colon"]
        questions.append(Quiz(question: "In a PA axial projection of a barium enema view, what is the anatomy that is being best demonstrated?", hasMultipleChoice: true, correctButton: multipleChoiceButtonC, buttonArray: multipleChoiceArray))
        
        // Makes the questions random
        shuffleQuestions()
    }
    
    func shuffleQuestions()
    {
        
    }
    
    func displayQuestion(number: Int)
    {
        // Sets the questions labels and number
        question.text=questions[number].question
        questionNumber.text="# \(number+1)"
        
        // displays the multiple choice buttons if the question has them
        if questions[number].hasMultipleChoice == true
        {
            multipleChoiceView.hidden=false
            
            multipleChoiceButtonA.setTitle(questions[number].buttonATitle, forState: UIControlState.Normal)
            multipleChoiceButtonB.setTitle(questions[number].buttonBTitle, forState: UIControlState.Normal)
            multipleChoiceButtonC.setTitle(questions[number].buttonCTitle, forState: UIControlState.Normal)
            multipleChoiceButtonD.setTitle(questions[number].buttonDTitle, forState: UIControlState.Normal)

        }
        else
        {
            multipleChoiceView.hidden=true
        }
    }

}
