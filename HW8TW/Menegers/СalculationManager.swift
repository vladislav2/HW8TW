//
//  СalculationManager.swift
//  HW8TW
//
//  Created by user on 22.02.2021.
//

import Foundation

class СalculationManager {
  
  func calculateСalories(gender: Int, weight: String, height: String, age: String, activity: Double) -> String {
    if gender == 0 {
      let doubleHeight = 88.36 + 4.8 * (Double(height) ?? 1.0)
      let doubleWeight = 13.4 * (Double(weight) ?? 1.0)
      let doubleAge = 5.7 * (Double(age) ?? 1.0)
      let result = (doubleHeight + doubleWeight - doubleAge) * activity
      return String(Int(result))
    }
    let doubleHeight = 447.6 + 3.1 * (Double(height) ?? 1.0)
    let doubleWeight = 9.2 * (Double(weight) ?? 1.0)
    let doubleAge = 4.3 * (Double(age) ?? 1.0)
    let result = (doubleHeight + doubleWeight - doubleAge) * activity
    return String(Int(result))
  }
}
