//
//  IMTViewController.swift
//  HW8TW
//
//  Created by Pandos on 21.02.2021.
//

import UIKit

class IMTViewController: UIViewController {
    
    var male = ["Мужской",
                 "Женский"]
    
    var selectedMale: String?
                    

    
    @IBOutlet weak var maleTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        choiceMale()
        createToolbar()
    }
    
    func createToolbar () {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        maleTF.inputAccessoryView = toolbar
        
        // Costamization
        
//        toolbar.tintColor = .black
//        toolbar.barTintColor = .gray

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func choiceMale() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        maleTF.inputView = elementPicker
        
        // Costamization
        
        elementPicker.backgroundColor = .clear
    }
    
    
}

extension IMTViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return male.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return male[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMale = male[row]
        maleTF.text = selectedMale
    }
    
    
}
