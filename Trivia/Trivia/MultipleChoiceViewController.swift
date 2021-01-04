//
//  MultipleChoiceViewController.swift
//  Trivia
//
//  Created by Josefina Perez on 02/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var btnAns1: UIButton!
    @IBOutlet var btnAns2: UIButton!
    @IBOutlet var btnAns3: UIButton!
    @IBOutlet var btnAns4: UIButton!
    

    
    var arrayQAA: [QuestionsAndAnswers] = []
    var correctBtn: UIButton?
    var buttons: [UIButton] = []
    var btnBool: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [btnAns1, btnAns2, btnAns3, btnAns4]
        configureAnswersBtns()
        configureUI()
    }
    
    
    func configureUI(){
        lblQuestion.text = arrayQAA.first?.question
        title = "Trivia!"
    }
    
    func configureAnswersBtns() {
        
        buttons.map({ button in button.setTitle(nil, for: .normal)})
        
        guard let questionAndAnswers = arrayQAA.first else { return }
        let correctIndex = Int.random(in: 1..<5) ?? 1
        
        switch correctIndex {
        case 1:
            btnAns1.setTitle(questionAndAnswers.correctAnswer, for: .normal)
            correctBtn = btnAns1
        case 2:
        btnAns2.setTitle(questionAndAnswers.correctAnswer, for: .normal)
            correctBtn = btnAns2
        case 3:
        btnAns3.setTitle(questionAndAnswers.correctAnswer, for: .normal)
            correctBtn = btnAns3
        case 4:
        btnAns4.setTitle(questionAndAnswers.correctAnswer, for: .normal)
            correctBtn = btnAns4
        default:
            break
        }
        
        for button in buttons {
            if button.title(for: .normal) == nil {
                button.setTitle(questionAndAnswers.incorrectAnswersArray.first, for: .normal)
                questionAndAnswers.incorrectAnswersArray.remove(at: 0)
            }
            button.configureBtns()
        }
    }
    
    
    @IBAction func btnsAction(sender: UIButton) {
        
        if sender == correctBtn {
            TriviaBuilderResults.correctAnswers += 1
        }
        else {
            TriviaBuilderResults.incorrectAnswers += 1
            
        }
        
        
        arrayQAA.removeFirst()
        
        
        
        if arrayQAA.count != 0 {
            configureAnswersBtns()
            lblQuestion.text = arrayQAA.first?.question
        
            }
            else{
            
            let vc = (storyboard?.instantiateViewController(withIdentifier: "results" ) as? ResultsViewController)!
            
            navigationController?.pushViewController(vc, animated: true)

        }
        
    }
    
    
}
