//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var submittedAnswer: Bool = false
    var questionNumber: Int = 0
    let questions: [Question] = QuestionBank().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(questions[questionNumber].questionText)
//        print(questions.count)
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            submittedAnswer = true
        } else if sender.tag == 2 {
            submittedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1;
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNumber < questions.count {
            questionLabel.text = questions[questionNumber].questionText
        } else {
            print("No More Question!!!!!!!!!!!!!!!")
//            startOver()
            
            displayAlert()
        }
    }
    
    
    func checkAnswer() {
        if submittedAnswer == questions[questionNumber].correctAnswer {
            print("CORRECT ANSWER!!!!")
        } else {
            print("WRONG!!!!!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    

    func displayAlert() {
        let alert = UIAlertController(title: "Good Job!", message: "You've completed the questions! Start over?", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Start Over", style: .default, handler: { (_ params: UIAlertAction) in
            print(params)
            self.startOver()
        })
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}
