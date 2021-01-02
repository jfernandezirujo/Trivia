//
//  TriviaRepository.swift
//  Trivia
//
//  Created by Josefina Perez on 31/12/2020.
//  Copyright © 2020 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class TriviaRepository {
    
    static func getCategories(completionHandler: @escaping (_ categories: [Category]?, _ error: Error?) -> Void) {
        
        let urlString = "https://opentdb.com/api_category.php"
        
        AF.request(urlString).validate().responseJSON(completionHandler: { response in
            
            if let error = response.error {
                print(error.errorDescription)
                completionHandler([], error)
            }
            
            else if let value = response.value {
                let json = JSON(value)
                let jsonCategories = json["trivia_categories"].arrayValue
                var arrayCategories: [Category] = []
                
                for item in jsonCategories {
                    let category = Category(json: item)
                    
                    arrayCategories.append(category)
                }
                
                completionHandler(arrayCategories, nil)
            }
        })
    }
    
    static func getQuestion(amount: String, id: String, type: String, completionHandler: @escaping (_ error: Error?, _ questionAndAnswers: [QuestionsAndAnswers]?) ->Void) {
        
        var urlString = "https://opentdb.com/api.php?amount=\(amount)&category=\(id)"
        
        if let enumType = Type(rawValue: type), enumType != .any {
            urlString.append("&type=\(enumType.parameterValue ?? "")")
        }
        
        AF.request(urlString).validate().responseJSON(completionHandler: {response in
            
        if let error = response.error {
                print(error.errorDescription)
                completionHandler(error, nil)
            }
        else if let value = response.value {
            let json = JSON(value)
            let jsonArray = json.arrayValue
            
            var arrayQAA: [QuestionsAndAnswers] = []
            
            for item in jsonArray {
                let queAndAn = QuestionsAndAnswers(json: item)
                
                arrayQAA.append(queAndAn)
            }
            completionHandler(nil, arrayQAA)
            }
            
        }
        )
        
    }
    
}
