//
//  PickerTableViewCell.swift
//  Trivia
//
//  Created by Josefina Perez on 31/12/2020.
//  Copyright © 2020 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var textField: UITextField!
    
    var field: Field?
    var indexPath: IndexPath?

    func configureCell(field: Field, indexPath: IndexPath) {
        self.field = field
        self.indexPath = indexPath
        lblTitle.text = field.title
        configurePicker()
    }
    
    func configurePicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
        
        
    }
    
    func setValueToBuilder(value: String) {
        switch indexPath?.row {
        case 0:
            TriviaBuilder.amount = value
        case 1:
            TriviaBuilder.category = value
        case 2:
            TriviaBuilder.difficulty = value
        case 3:
            TriviaBuilder.type = value
        default:
            break
        }
    }

}

extension PickerTableViewCell : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return field?.options.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return field?.options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = field?.options[row]
        setValueToBuilder(value: textField.text ?? "")
        textField.resignFirstResponder()
    }
}
