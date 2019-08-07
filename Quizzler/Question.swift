//
//  Question.swift
//  Quizzler
//
//  Created by Will on 7/8/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let correctAnswer: Bool
    
    init(_ text: String, _ answer: Bool) {
        questionText = text
        correctAnswer = answer
    }
}
