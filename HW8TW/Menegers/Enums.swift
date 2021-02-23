//
//  Enums.swift
//  HW8TW
//
//  Created by user on 21.02.2021.
//

import Foundation

enum Activity: Double, CaseIterable {
  case minimal = 1.2
  case low = 1.375
  case middle = 1.55
  case high = 1.725
  case overHigh = 1.9
  
  var valueForActivity: String {
    switch self {
    case .minimal:
      return "Минимальная"
    case .low:
      return "Низкая"
    case .middle:
      return "Средняя"
    case .high:
      return "Высокая"
    case .overHigh:
      return "Очень высокая"
    }
  }
}
