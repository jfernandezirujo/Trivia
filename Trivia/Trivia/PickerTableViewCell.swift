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
    

    func configureCell(field: Field) {
        self.field = field
        lblTitle.text = field.title
        configurePicker()
    }
    
    func configurePicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
        
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
    
    
}
