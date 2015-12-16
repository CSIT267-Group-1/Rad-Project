//
//  InstructionsViewController.swift
//  RadApp
//
//  Created by csit267-8 on 12/16/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    var instructions =
    [
    "1. The Quiz will display up to 10 different question for you to answer./n/n2. There will be two different types of questions that can be shown./n/tA) The first type will display four multiple choice answer for you to choose./n/t   - Tap one of the four answers to pick your answer./n/tB) The second type will not display any multiple choice answer and will instead ask you to tab a location on the picture./n/n3. After choosing an answer, tap the submit button to see if your answer was correct./n/n4. A messaged will be displayed with the result of your answer./n/n5. The correct answer will be highlighted in green./n/n6. If your answer was wrong, you will see you answer chosen as red and the correct answer highlighted in green."
    ]
    
    @IBAction func dimiss(sender: AnyObject) {
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
