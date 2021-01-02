//
//  QuestionAndAnswers.swift
//  Trivia
//
//  Created by Josefina Perez on 01/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import SwiftyJSON

class QuestionsAndAnswers {
    
    var question: String
    var incorrectAnswers: String
    var correctAnswer: String
    
    init(json: JSON) {
        self.question = json["question"].stringValue
        self.incorrectAnswers = json["incorrect_answers"].stringValue
        self.correctAnswer = json["correct_answer"].stringValue
    }
    
}
