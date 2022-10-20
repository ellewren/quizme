//
//  Questions.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 9/5/22.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String


    init(q: String, a: [String], correctAnswer: String) {
    text = q
    answers = a
    rightAnswer = correctAnswer
    }
}
