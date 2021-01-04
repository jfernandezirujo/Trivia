//
//  Type.swift
//  Trivia
//
//  Created by Josefina Perez on 01/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation


enum Type: String {
    case multipleChoice = "Multiple Choice"
    case trueOrFalse = "Verdadero / Falso"
    case any = "Cualquier Tipo"

var parameterValue: String? {
     switch self {
     case .multipleChoice:
        return "multiple"
     case .trueOrFalse:
        return "boolean"
     case .any:
        let random = Int.random(in: 1...2) ?? 1
        return (random == 1 ? "boolean" : "multiple")
        
    }
    }
    
    static func buildType(string: String) -> String? {
        switch string {
        case "multiple":
            return Type.multipleChoice.rawValue
        case "boolean":
            return Type.trueOrFalse.rawValue
        default:
            return nil
        }
    }
}
