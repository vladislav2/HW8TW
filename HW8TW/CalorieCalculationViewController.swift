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
  
  @IBAction func activityChangeButton(_ sender: UIButton) {
    showAlert()
  }
  
  @IBAction func calculateButtonPressed() {
    resultLabel.text = СalculationManager().calculateСalories(gender: genderSegmentedControl.selectedSegmentIndex, weight: Double(weightTextField.text ?? "1") ?? 1, height: Double(heightTextField.text ?? "1") ?? 1, age: Double(ageTextField.text ?? "1") ?? 1, activity: activity).1
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
}

// MARK: - Alert Controller

extension CalorieCalculationViewController {
  private func showAlert() {
    let pickerViewController = UIViewController()
    pickerViewController.preferredContentSize = CGSize(width: 250.0, height: 120.0)
    let picker = UIPickerView(frame: CGRect(x: 0.0, y: 0.0, width: 250.0, height: 120.0))
    picker.delegate = self
    picker.dataSource = self
    pickerViewController.view.addSubview(picker)
    
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    alert.setValue(pickerViewController, forKey: "contentViewController")
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
      self.activityButton.setTitle(Activity.allCases[picker.selectedRow(inComponent: 0)].valueForActivity, for: .normal)
    }
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    alert.addAction(cancel)
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

// MARK: - UIPickerViewDataSource

extension CalorieCalculationViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    Activity.allCases.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    Activity.allCases[row].valueForActivity
  }
}
 
// MARK: - UIPickerViewDelegate

extension CalorieCalculationViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch row {
    case 1: activity = Activity.low.rawValue
    case 2: activity = Activity.middle.rawValue
    case 3: activity = Activity.high.rawValue
    case 4: activity = Activity.overHigh.rawValue
    default:
      activity = Activity.minimal.rawValue
    }
    print(activity)
  }
}
