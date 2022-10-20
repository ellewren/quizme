//
//  QuizViewController.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 9/3/22.
//

import UIKit

class AnimalViewController: UIViewController {
    
    
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var quizQuestion: UILabel!
    
    @IBOutlet weak var quizProgress: UIProgressView!
    
    @IBOutlet weak var userScore: UILabel!
    
    @IBOutlet weak var timeLeft: UILabel!
    
    var questionTime = 30
    
    
    var animalQuiz = AnimalQuiz()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func answerChosen(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = animalQuiz.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        animalQuiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
                
                quizQuestion.text = animalQuiz.getQuestionText()
                
                
                let answerChoices = animalQuiz.getAnswers()
                answer1.setTitle(answerChoices[0], for: .normal)
                answer2.setTitle(answerChoices[1], for: .normal)
                answer3.setTitle(answerChoices[2], for: .normal)
                answer4.setTitle(answerChoices[2], for: .normal)
                
                quizProgress.progress = animalQuiz.getProgress()
                userScore.text = "Score: \(animalQuiz.getScore())"
                
                answer1.backgroundColor = UIColor.clear
                answer2.backgroundColor = UIColor.clear
                answer3.backgroundColor = UIColor.clear
                
            }
            
}
        
        
        

