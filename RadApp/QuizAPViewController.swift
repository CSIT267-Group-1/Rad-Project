//
//  QuizAPViewController.swift
//  RadApp
//
//  Created by Koby Samuel on 12/2/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class QuizAPViewController: UIViewController {
    
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
    
    @IBAction func dismissQuiz(sender: AnyObject?) {
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
        
        questions.append(Quiz(question: "In an AP axial projection of a barium enema view, what is the anatomy that is being best demonstrated?", hasMultipleChoice: false, correctButton: sigmoid, buttonArray: nil))
        questions.append(Quiz(question: "In an AP axial oblique (LPO) projection of a barium enema view, what is the anatomy that is being best demonstrated?", hasMultipleChoice: false, correctButton: sigmoid, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the transverse colon on an AP view of a barium enema?", hasMultipleChoice: false, correctButton: tranCol, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the ascending colon on an AP view of a barium enema?", hasMultipleChoice: false, correctButton: ascCol, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the descending colon on an AP view of a barium enema?", hasMultipleChoice: false, correctButton: descCol, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the hepatic flexure on an AP view of a barium enema?", hasMultipleChoice: false, correctButton: hepFelx, buttonArray: nil))
        questions.append(Quiz(question: "What is the location of the splenic flexure on an AP view of a barium enema?", hasMultipleChoice: false, correctButton: spleFlex, buttonArray: nil))
        
        multipleChoiceArray = ["Barium-filled", "Airfilled", "Not Filled", "Both Barium and Ait Filled"]
        questions.append(Quiz(question: "The transverse colon on a AP view of a barium enema should be __________ filled?", hasMultipleChoice: true, correctButton: multipleChoiceButtonB, buttonArray: multipleChoiceArray))
        
        multipleChoiceArray = ["Barium-filled", "Airfilled", "Not Filled", "Both Barium and Ait Filled"]
        questions.append(Quiz(question: "In an AP view of a barium enema, Is the transverse colon filled with ______________?", hasMultipleChoice: true, correctButton: multipleChoiceButtonA, buttonArray: multipleChoiceArray))
        

        // Makes the questions random
        shuffleQuestions()
    }
    
    func shuffleQuestions()
    {
        let totalQuestion = questions.count
        var randomInt: Int
        var tempQuestions = [Quiz]()
        
        //picks a random question from the questions arrray and moves it to the temp array
        for var count = 0; count < totalQuestion; count++
        {
            randomInt = Int(arc4random_uniform(UInt32(questions.count)))
            tempQuestions.append(questions[randomInt])
            questions.removeAtIndex(randomInt)
        }
        
        // sets the new shuffled question to the main array
        questions=tempQuestions
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
            
            // for end of quiz
            if self.currentSelectedQuestionIndex+1 == self.questions.count
            {
                self.endOfQuiz()
            }
            else
            {
                self.resetSelection()
                self.currentSelectedQuestionIndex++
                self.displayQuestion(self.currentSelectedQuestionIndex)
            }
            
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
            
            //for end of quiz
            if self.currentSelectedQuestionIndex+1 == self.questions.count
            {
                self.endOfQuiz()
            }
            else
            {
                self.resetSelection()
                self.currentSelectedQuestionIndex++
                self.displayQuestion(self.currentSelectedQuestionIndex)
            }
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
        //displays results of the user
        let alertController = UIAlertController(title: "End of Quiz", message: "You scored \(right)/\(questions.count).", preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
            
            self.displayEmail()
        })
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func displayEmail()
    {
        //TESTING
        dismissQuiz(nil)
    }
}
