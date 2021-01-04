//
//  ViewController.swift
//  Trivia
//
//  Created by Josefina Perez on 31/12/2020.
//  Copyright © 2020 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var btnContinue: UIButton!
    var fields: [Field] = []
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFields()
        configUI()
        
    }
    
    func configUI() {
        btnContinue.configureBtns()
        btnContinue.setTitle("Comenzar", for: .normal)
        
        title = "Inicio"
        
    }
    
    func createFields() {
        var numberOfQuestions = Field(title: "Cantidad de preguntas", options: [])
        for number in 1...50 {
            numberOfQuestions.options.append(String(number))
        }
        
        var category = Field(title: "Categoría", options: [])
        
        let difficulty = Field(title: "Dificultad", options: [Difficulty.any.rawValue, Difficulty.easy.rawValue, Difficulty.medium.rawValue, Difficulty.hard.rawValue])
        
        let type = Field(title: "Tipo", options: [Type.any.rawValue, Type.multipleChoice.rawValue, Type.trueOrFalse.rawValue])
        
        TriviaRepository.getCategories(completionHandler: {categories, error in
            
            if let error = error {
                print(error)
            }
            else if let categories = categories {
                self.categories = categories
                categories.forEach({ cate in
                    category.options.append(cate.name)
                })
            }
        })
        
        fields = [numberOfQuestions, category, difficulty, type]
    }
    
    
    func getCategory() -> Category? {
        guard let category = categories.first(where: { cat in
            cat.name == TriviaBuilder.category
        }) else { return nil }
        
        return category
    }
    
    
    @IBAction func continueTrivia() {
        guard let idCategory = getCategory()?.id else { return }
        
        TriviaRepository.getQuestion(amount: TriviaBuilder.amount, id: idCategory, type: TriviaBuilder.type, completionHandler: { error, questionAndAnswers in
            
            if let error = error{
                print(error)
            }
            
            else if let questionAndAnswers = questionAndAnswers{
                if TriviaBuilder.type == Type.trueOrFalse.rawValue {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "trueOrFalse") as? TrueOrFalseViewController{
                        vc.arrayQAA = questionAndAnswers
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                }
                
                else if TriviaBuilder.type == Type.multipleChoice.rawValue {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "multiple") as? MultipleChoiceViewController{
                        vc.arrayQAA = questionAndAnswers
                                           
                    self.navigationController?.pushViewController(vc, animated: true)
                                       }
                                   }
            }
            
        })
        
    }
}





extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell") as? PickerTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(field: fields[indexPath.row], indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
        
    }

}
