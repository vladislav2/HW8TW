//
//  CalorieCalculationViewController.swift
//  HW8TW
//
//  Created by user on 21.02.2021.
//

import UIKit

class CalorieCalculationViewController: UIViewController {

  @IBOutlet weak var heightTextField: UITextField!
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  
  @IBOutlet weak var activityButton: UIButton!
  
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  @IBAction func changeGender(_ sender: UISegmentedControl) {
    
  }
  
  @IBAction func activityChangeButton(_ sender: UIButton) {
    
  }
  
  @IBAction func calculateButtonPressed() {
    
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
