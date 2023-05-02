//
//  Question.swift
//  Quizzler
//
//  Created by Ольга Шовгенева on 22.04.2023.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
