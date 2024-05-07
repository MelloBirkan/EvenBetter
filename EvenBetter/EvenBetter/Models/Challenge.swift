//
//  Challenge.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct Challenge {
  let mood: MoodType
  let name: String
  let sumarry: String
  let image: Image
  
  static let sampleData = Challenge(mood: .ansioso, name: "Meditar", sumarry: "A meditação", image: Image(.meditation2))
  
//  func getChallenge(mood: Mood) {
//    switch mood.type {
//    case .feliz:
//      <#code#>
//    case .triste:
//      <#code#>
//    case .ansioso:
//      <#code#>
//    case .motivado:
//      <#code#>
//    case .bravo:
//      <#code#>
//    case .cansado:
//      <#code#>
//    case .all:
//      <#code#>
//    }
//  }
}
