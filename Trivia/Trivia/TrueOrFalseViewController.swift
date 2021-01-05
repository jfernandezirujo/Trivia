//
//  TrueOrFalseViewController.swift
//  Trivia
//
//  Created by Josefina Perez on 02/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class TrueOrFalseViewController: UIViewController {

    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var btnContinue: UIButton!
    
    
    var arrayQAA: [QuestionsAndAnswers] = []
    
    var segmentedControlBool: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        confiureUI()
        configureQuestions()
        
        }
    
    
    func confiureUI() {
        btnContinue.configureBtns()
        btnContinue.setTitle("Siguiente", for: .normal)
        btnContinue.isEnabled = false
        
        title = "Trivia!"
        
        segmentedControl.setTitle("Verdadero", forSegmentAt: 0)
        segmentedControl.setTitle("Falso", forSegmentAt: 1)
        
        segmentedControl.backgroundColor = .yellow
        
    }
    
    func configureQuestions(){
        guard let questionAndAnswers = arrayQAA.first else { return }
        lblQuestion.text = questionAndAnswers.question
        btnContinue.isEnabled = false
        
    }
     
    @IBAction func answer() {
        btnContinue.isEnabled = true
        
       guard let questionAndAnswers = arrayQAA.first else { return }
        
        if questionAndAnswers.correctAnswer == "True" && segmentedControl.selectedSegmentIndex == 0 {
            segmentedControlBool = true
        }
        
        else if questionAndAnswers.correctAnswer == "False" && segmentedControl.selectedSegmentIndex == 1 {
            segmentedControlBool = true
        }
        
        else{
            segmentedControlBool = false
        }

}
    
    
    @IBAction func reloadQuestion(){
        if segmentedControlBool == true {
            TriviaBuilderResults.correctAnswers += 1
        }
        else {
        TriviaBuilderResults.incorrectAnswers += 1
        }
        
        arrayQAA.removeFirst()
        
        if arrayQAA.count != 0 {
        segmentedControlBool = nil
        configureQuestions()
    
        }
        else{
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "results" ) as? ResultsViewController)!
        
            
    
            
        navigationController?.pushViewController(vc, animated: true)

    }
    }
}
