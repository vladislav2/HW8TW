//
//  CalorieCalculationViewController.swift
//  HW8TW
//
//  Created by user on 21.02.2021.
//

import UIKit

class CalorieCalculationViewController: UIViewController {

  @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
  
  @IBOutlet weak var heightTextField: UITextField!
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  
  @IBOutlet weak var activityButton: UIButton!
  
  @IBOutlet weak var resultLabel: UILabel!
  
  private var activity = 1.2
  private var result = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addDoneButton(to: heightTextField, weightTextField, ageTextField)
    
  }
    
  @IBAction func changeGender(_ sender: UISegmentedControl) {
    
  }
  
  @IBAction func activityChangeButton(_ sender: UIButton) {
    
  }
  
  @IBAction func calculateButtonPressed() {
    
    if genderSegmentedControl.selectedSegmentIndex == 0 {
      let height = Double(heightTextField.text ?? "1") ?? 1
      let weight = Double(weightTextField.text ?? "1") ?? 1
      let age = Double(ageTextField.text ?? "1") ?? 1
      let resultMale = 88.36 + (4.8 * height) + (13.4 * weight) - (5.7 * age)
      result = Int(resultMale * activity)
      resultLabel.text = String(result)
    } else {
      let height = Double(heightTextField.text ?? "1") ?? 1
      let weight = Double(weightTextField.text ?? "1") ?? 1
      let age = Double(ageTextField.text ?? "1") ?? 1
      let resultFemale = 447.6 + (3.1 * height) + (9.2 * weight) - (4.3 * age)
      result = Int(resultFemale * activity)
      resultLabel.text = String(result)
    }
    
  }
  
//  для мужчин: BMR = 88.36 + (13.4 x вес, кг) + (4.8 х рост, см) – (5.7 х возраст, лет)
//  для женщин: BMR = 447.6 + (9.2 x вес, кг) + (3.1 х рост, cм) – (4.3 х возраст, лет)
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
}

// MARK: - Alert Controller

extension CalorieCalculationViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard

extension CalorieCalculationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == ageTextField {
          //passwordTextField.becomeFirstResponder()
        } else {
          //logInPressed()
        }
        return true
    }
}

extension CalorieCalculationViewController {
  private func addDoneButton(to textFields: UITextField...) {
    textFields.forEach { (textField) in
      let keyboardToolBar = UIToolbar()
      textField.inputAccessoryView = keyboardToolBar
      keyboardToolBar.sizeToFit()
      
      let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapButton))
      
      let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
      keyboardToolBar.items = [flexBarButton, doneButton]
    }
  }
  
  @objc private func didTapButton() {
    view.endEditing(true)
  }
}
