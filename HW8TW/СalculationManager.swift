//
//  СalculationManager.swift
//  HW8TW
//
//  Created by user on 22.02.2021.
//

import Foundation

class СalculationManager {
  
  func calculateСalories(gender: Int, weight: Double, height: Double, age: Double, activity: Double) -> (Int, String) {
    if gender == 0 {
      let resultMale = 88.36 + (4.8 * height) + (13.4 * weight) - (5.7 * age)
      let result = Int(resultMale * activity)
      return (result, String(result))
    } else {
      let resultFemale = 447.6 + (3.1 * height) + (9.2 * weight) - (4.3 * age)
      let result = Int(resultFemale * activity)
      return (result, String(result))
    }
  }
}
