//
//  Difficulty.swift
//  Trivia
//
//  Created by Josefina Perez on 01/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.


import Foundation

enum Difficulty: String {
    case easy = "Fácil"
    case medium = "Medio"
    case hard = "Difícil"
    case any = "Cualquier dificultad"
    
    
    var parameterValue: String? {
        switch self {
               case .easy:
                   return "easy"
               case .medium:
                   return "medium"
               case .hard:
                   return "hard"
               case .any:
                   return nil
               }
    }
}
