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
    
    let height = [Int](90...220)
    
    let weight = [Int](40...150)
    
    @IBOutlet weak var maleTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var resultButtonLabel: UIButton!
    
    @IBOutlet weak var imtNumberLabel: UILabel!
    @IBOutlet weak var imtDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButtonLabel.layer.cornerRadius = 15
        imtNumberLabel.isHidden = true
        imtDescription.isHidden = true
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {

guard let heightInt = heightTF.text,
      let weightInt = weightTF.text,
        
      let h = Double(heightInt),
      let w = Double(weightInt)
      else { return }

      let imt = w / ((h/100) * (h/100))
        
      imtNumberLabel.text = String(format: "%.1f", imt)
      imtNumberLabel.isHidden = false
      imtDescription.isHidden = false
        
        if maleTF.text == "Мужской" {
            switch imt {
            case 0...19:
                viewOutlet.backgroundColor = .systemTeal
                imtDescription.text = "У Вас дефицит веса"
            case 19...25:
                viewOutlet.backgroundColor = .systemGreen
                imtDescription.text = "У Вас идеальный вес"
            case 25...30:
                viewOutlet.backgroundColor = .systemOrange
                imtDescription.text = "У Вас избыточный вес"
            case 31...100:
                viewOutlet.backgroundColor = .systemRed
                imtDescription.text = "Вы страдаете ожирением"
            default:
                break
            }
        } else {
            switch imt {
            case 0...18:
                viewOutlet.backgroundColor = .systemTeal
                imtDescription.text = "У Вас дефицит веса"
            case 18...23.8:
                viewOutlet.backgroundColor = .systemGreen
                imtDescription.text = "У Вас идеальный вес"
            case 23.9...28.5:
                viewOutlet.backgroundColor = .systemOrange
                imtDescription.text = "У Вас избыточный вес"
            case 28.5...100:
                viewOutlet.backgroundColor = .systemRed
                imtDescription.text = "Вы страдаете ожирением"
            default:
                break
            }
        }
    }
}

extension IMTViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
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
            return String(height[row])
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
            heightTF.text = String(height[row])
            self.view.endEditing(true)
        } else if currentTextField == weightTF {
            weightTF.text = String(weight[row])
            self.view.endEditing(true)
        }
        
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
