//
//  MusicQuiz.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 10/16/22.
//

import Foundation

struct MusicQuiz {
    
    var questionNumber = 0
    var score = 0
    
    let musicQuiz = [
        Question(q: "Who was the first american idol winner?", a: ["Ruben Studdard, Jordin Sparks, Kelly Clarkson, Fantasia Barrino "], correctAnswer: "Kelly Clarkson"),
        Question(q: "Before Miley Cyrus recorded 'Wrecking Ball', it was offered to what singer?", a: ["Beyonce, Ariana Grande, Taylor Swift, Lady Gaga"], correctAnswer: "Beyonce"),
        Question(q: "Who founded Motown Records", a: ["L.A. Reid, Irving Azoff, Clive Davis, Berry Gordy"], correctAnswer: "Berry Gordy"),
        Question(q: "What children's show do Ryan Gosling, Keri Russell, and Justin Timberlake all have in common?", a: ["The Mickey Mouse Club, "], correctAnswer: "The Mickey Mouse Club")
    ]
    
    func getQuestionText() -> String {
        return musicQuiz[questionNumber].text
    }
    
    func getAnswers() -> [String] {
        return musicQuiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(musicQuiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < musicQuiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {

        if userAnswer == musicQuiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
}
    
