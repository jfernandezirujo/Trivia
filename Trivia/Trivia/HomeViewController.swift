//
//  ViewController.swift
//  Trivia
//
//  Created by Josefina Perez on 31/12/2020.
//  Copyright © 2020 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var fields: [Field] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createFields()
        
    }
    
    func createFields() {
        var numberOfQuestions = Field(title: "Cantidad de preguntas", options: [])
        
        for number in 1...50 {
            numberOfQuestions.options.append(String(number))
        }
        
        let category = Field(title: "Categoría", options: ["x"])
        let difficulty = Field(title: "Dificultad", options: ["Cualquier Dificultad", "Facil", "Medio", "dificil"])
        let type = Field(title: "Tipo", options: ["Cualquier Tipo", "Multiple Choice", "Verdadero / Falso"])
        
        
        fields = [numberOfQuestions, category, difficulty, type]
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell") as? PickerTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(field: fields[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    
}

