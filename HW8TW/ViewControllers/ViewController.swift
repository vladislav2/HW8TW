//
//  ViewController.swift
//  HW8TW
//
//  Created by user on 21.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imtOutlet: UIButton!
    @IBOutlet weak var kkalOutlet: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
        nameLabel.layer.masksToBounds = true
    nameLabel.layer.cornerRadius = 10
    imtOutlet.layer.cornerRadius = 50
    kkalOutlet.layer.cornerRadius = 50
    
  }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        }
}

