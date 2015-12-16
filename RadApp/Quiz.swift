//
//  Quiz.swift
//  RadApp
//
//  Created by csit267-8 on 12/9/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//
//  Creates a quiz class that conatins:
//      1 - Question
//      2 - Boolean to determine if the question is multiple choice
//      3 - Correct Button 
//      4 - Titles for all the multiple choice questions
//

import UIKit

class Quiz
{
    var question: String!
    var hasMultipleChoice: Bool!
    var correctButton: UIButton!
    var buttonATitle: String!
    var buttonBTitle: String!
    var buttonCTitle: String!
    var buttonDTitle: String!
    var correct: Bool!
    var correctStr: String!
    var userAnswer: String!
    var bariumQues: Bool!
    //
    init (question: String, hasMultipleChoice: Bool, correctButton: UIButton, buttonArray: [String]?, bariumQuestion: Bool)
    {
        self.question=question
        self.hasMultipleChoice=hasMultipleChoice
        self.correctButton=correctButton
        correct = false
        correctStr = ""
        userAnswer = ""
        bariumQues=bariumQuestion
        
        if (buttonArray != nil)
        {
            setButtonTitles(buttonArray!)
        }
    }
    
    func setButtonTitles(buttonArray: [String])
    {
        buttonATitle=buttonArray[0]
        buttonBTitle=buttonArray[1]
        buttonCTitle=buttonArray[2]
        buttonDTitle=buttonArray[3]
    }

}
