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
    var incorrectAnswersArray: [String]
    var correctAnswer: String
    
    
    
    init(json: JSON) {
        self.question = json["question"].stringValue
        self.incorrectAnswersArray = json["incorrect_answers"].arrayValue.map({json in
            json.stringValue
        })
        
        self.correctAnswer = json["correct_answer"].stringValue
        TriviaBuilder.type = Type.buildType(string: json["type"].stringValue) ?? ""
    }
    
}
