//
//  ViewController.swift
//  Sam Quiz 3
//
//  Created by Sameehan Patel on 2/23/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
        
        @IBOutlet var nextQuestionLabel: UILabel!
        @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
        
        @IBOutlet var currentQuestionLabel: UILabel!
        @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
        
        @IBOutlet var answerLabel: UILabel!
        
        let questions = ["From what is cognac made?",
            "What is 7+7?",
            "What is the capital of Vermont?"]
        let answers = ["Grapes",
            "14",
            "Montpelier"]
        
        var currentQuestionIndex = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            currentQuestionLabel.text = questions[currentQuestionIndex]
            updateOffScreenLabel()
        }
        
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            
            // Set the label's initial alpha
            nextQuestionLabel.alpha = 0
        }
        
        func animateLabelTransitions() {
            
            view.layoutIfNeeded()
            
            //let screenWidth = view.frame.width
            //self.nextQuestionLabelCenterXConstraint.constant = 0
            //self.currentQuestionLabelCenterXConstraint.constant += screenWidth
            
            UIView.animateWithDuration(0.5,
                delay: 0,
                options: [.CurveLinear],
                animations: {
                    self.currentQuestionLabel.alpha = 0
                    self.nextQuestionLabel.alpha = 1
                    
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    //swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                    //swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                    
                    self.updateOffScreenLabel()
            })
        }
        
        func updateOffScreenLabel() {
           // let screenWidth = view.frame.width
        
        }
        
        @IBAction func showNextQuestion(sender: AnyObject) {
            ++currentQuestionIndex
            if currentQuestionIndex == questions.count {
                currentQuestionIndex = 0
            }
            
            let question = questions[currentQuestionIndex]
            nextQuestionLabel.text = question
            answerLabel.text = "???"
            
            animateLabelTransitions()
        }
        
        @IBAction func showAnswer(sender: AnyObject) {
            let answer = answers[currentQuestionIndex]
            answerLabel.text = answer
        }
    }




