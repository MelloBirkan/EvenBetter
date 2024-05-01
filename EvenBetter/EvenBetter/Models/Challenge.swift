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
}
