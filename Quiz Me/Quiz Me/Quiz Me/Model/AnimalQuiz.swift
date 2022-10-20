//
//  AnimalQuiz.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 10/16/22.
//

import Foundation

struct AnimalQuiz {
    
    var questionNumber = 0
    var score = 0
    
    let animalQuiz = [
        Question(q: "What is a group of cats called", a: ["A pack, A clowder, A school, A herd"], correctAnswer: "A clowder")
        
    ]
    
    func getQuestionText() -> String {
        return animalQuiz[questionNumber].text
    }
    
    func getAnswers() -> [String] {
        return animalQuiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(animalQuiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < animalQuiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {

        if userAnswer == animalQuiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
}
    

