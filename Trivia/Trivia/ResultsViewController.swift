//
//  ResultsViewController.swift
//  Trivia
//
//  Created by Josefina Perez on 04/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var lblFinish: UILabel!
    @IBOutlet var lblResults: UILabel!
    @IBOutlet var btnReturn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        navigationItem.hidesBackButton = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        TriviaBuilderResults.correctAnswers = 0
        TriviaBuilderResults.incorrectAnswers = 0
    }
    
    
    func configureUI() {
        title = "Resultados"
        
        btnReturn.configureBtns()
        btnReturn.setTitle("Volver", for: .normal)
        
        lblFinish.text = "Resultados"
        
        lblResults.text = "-Respuestas correctas: \(TriviaBuilderResults.correctAnswers) \n-Respuestas incorrectas: \(TriviaBuilderResults.incorrectAnswers)"
        
    
    }
    
    

    @IBAction func returnHome(){
        
        navigationController?.popToRootViewController(animated: true)
    }

}
