//
//  MoviesQuiz.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 10/16/22.
//

import Foundation

struct MoviesQuiz {
    
    var questionNumber = 0
    var score = 0
    
    let moviesQuiz = [
    Question(q: "What was the first feature-length animated movie ever released?", a: ["Snow White and the Seven Dwarfs, A Bugs Life, Beauty and the Beast, Cinderella"], correctAnswer: "Snow White and the Seven Dwarfs")
    
    ]
    
    func getQuestionText() -> String {
        return moviesQuiz[questionNumber].text
    }
    
    func getAnswers() -> [String] {
        return moviesQuiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(moviesQuiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < moviesQuiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {

        if userAnswer == moviesQuiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    
    
}
