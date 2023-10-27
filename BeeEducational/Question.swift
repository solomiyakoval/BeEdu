//
//  QuizQuestions.swift
//  BeeEducational
//
//  Created by Solomiya Koval on 20.10.2023.
//

import Foundation

struct Question {
    let id = UUID.self
    var question: String
    var choices: [String]
    var answer: String
    
}
