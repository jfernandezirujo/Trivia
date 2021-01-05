//
//  Category.swift
//  Trivia
//
//  Created by Josefina Perez on 31/12/2020.
//  Copyright © 2020 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {
    var name: String
    var id: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.id = json["id"].stringValue
    }
    
}
