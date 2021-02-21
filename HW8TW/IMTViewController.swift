//
//  IMTViewController.swift
//  HW8TW
//
//  Created by Pandos on 21.02.2021.
//

import UIKit

class IMTViewController: UIViewController {
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    let male = ["Мужской",
                 "Женский"]
    
    let height = ["100","101","102","103","104","105","106","107","108","109","110","111"]
    
    let weight = [60, 65, 70, 75, 80, 85, 90]
    
    var selectedMale: String?
                    
    @IBOutlet weak var maleTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

//        choiceMale()
//        createToolbar()
    }
    
//    func createToolbar () {
//
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title: "Done",
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(dismissKeyboard))
//
//        toolbar.setItems([doneButton], animated: true)
//        toolbar.isUserInteractionEnabled = true
//
//        maleTF.inputAccessoryView = toolbar
//
//    }
    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }

//    func choiceMale() {
//        let elementPicker = UIPickerView()
//        elementPicker.delegate = self
//        maleTF.inputView = elementPicker
//
//        // Costamization
//
//        elementPicker.backgroundColor = .clear
//    }
    
}

extension IMTViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return male.count
        if currentTextField == maleTF {
            return male.count
        } else if currentTextField == heightTF {
            return height.count
        } else if currentTextField == weightTF  {
            return weight.count
        } else {
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == maleTF {
            return male[row]
        } else if currentTextField == heightTF {
            return height[row]
        } else if currentTextField == weightTF {
            return String(weight[row])
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == maleTF {
            maleTF.text = male[row]
            self.view.endEditing(true)
        } else if currentTextField == heightTF {
            heightTF.text = height[row]
            self.view.endEditing(true)
        } else if currentTextField == weightTF {
            weightTF.text = String(weight[row])
            self.view.endEditing(true)
        }
        
        
//        selectedMale = male[row]
//        maleTF.text = selectedMale
    }
    
    
}

extension IMTViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        if currentTextField == maleTF {
            currentTextField.inputView = pickerView
        } else if currentTextField == heightTF {
            currentTextField.inputView = pickerView
        } else if currentTextField == weightTF {
            currentTextField.inputView = pickerView
        }
    }
}
