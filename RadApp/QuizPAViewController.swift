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
    var right: Int = 0
    var wrong: Int = 0
    
    @IBOutlet var hepFelx: UIButton!
    @IBOutlet var tranCol: UIButton!
    @IBOutlet var spleFlex: UIButton!
    @IBOutlet var sigmoid: UIButton!
    @IBOutlet var descCol: UIButton!
    @IBOutlet var ascCol: UIButton!
    @IBOutlet var question: UILabel!
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var multipleChoiceButtonA: UIButton!
    @IBOutlet var multipleChoiceButtonB: UIButton!
    @IBOutlet var multipleChoiceButtonC: UIButton!
    @IBOutlet var multipleChoiceButtonD: UIButton!
    @IBOutlet var multipleChoiceView: UIStackView!
    
    var questions: [Quiz] = [Quiz]()
    
    @IBAction func submit(sender: AnyObject) {
        
        if currentSelectedArea == nil
        {
            let alertController = UIAlertController(title: "Select an Area", message: "You did no choose and answer to submit. Please selected a answer.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
            })
            
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            // display correct if right answer
            if currentSelectedArea == questions[currentSelectedQuestionIndex].correctButton
            {
                displayCorrect()
            }
            else
            {
                displayWrong()
            }
        }
        
        if currentSelectedQuestionIndex+1 == questions.count
        {
            endOfQuiz()
        }
        
    }
    
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
        currentSelectedQuestionIndex = 0
        createQuestions()
        displayQuestion(currentSelectedQuestionIndex)
        
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
    
    //displays a question in the questions array by the given index number pasted
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
    
    // displays the correct answer
    func displayCorrect()
    {
        right++
        //dispalys the correct question as green
        questions[currentSelectedQuestionIndex].correctButton.backgroundColor=UIColor.greenColor()
        
        //sets corrct variable to true and the text of the answer
        questions[currentSelectedQuestionIndex].correct=true
        questions[currentSelectedQuestionIndex].correctStr=questions[currentSelectedQuestionIndex].correctButton.titleLabel?.text
        questions[currentSelectedQuestionIndex].userAnswer=currentSelectedArea.titleLabel?.text

        //display the alert to left the user know what they did
        let alertController = UIAlertController(title: "Your Answer Was Right", message: "Good Job.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
            self.resetSelection()
            self.currentSelectedQuestionIndex++
            self.displayQuestion(self.currentSelectedQuestionIndex)

        })
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)

    }
    
    // displays the wrong answer
    func displayWrong()
    {
        wrong++
        
        // display the correct answer as green
        questions[currentSelectedQuestionIndex].correctButton.backgroundColor=UIColor.greenColor()
        
        //sets correct variable to false and the text of the answer
        questions[currentSelectedQuestionIndex].correct=false
        questions[currentSelectedQuestionIndex].correctStr=questions[currentSelectedQuestionIndex].correctButton.titleLabel?.text
        questions[currentSelectedQuestionIndex].userAnswer=currentSelectedArea.titleLabel?.text
        
        //displays a alert control to let the user know they were wrong
        let alertController = UIAlertController(title: "Your Answer Was Wrong", message: "The correct answer is highlighted in green.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
            
            self.resetSelection()
            self.currentSelectedQuestionIndex++
            self.displayQuestion(self.currentSelectedQuestionIndex)
        })
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)

    }
    
    // resets the users selection so nothing is displayed
    func resetSelection()
    {
        currentSelectedArea.backgroundColor=UIColor.clearColor()
        currentSelectedArea=nil
        questions[currentSelectedQuestionIndex].correctButton.backgroundColor=UIColor.clearColor()

    }
    
    // for the end of the quiz
    func endOfQuiz()
    {
        
    }

}
