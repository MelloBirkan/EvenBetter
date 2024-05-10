//
//  ChallengeOO.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 05/05/24.
//

import Foundation
import SwiftUI

@Observable
final class ChallengeOO {
  var challenge = [Challenge]()
  
  static let sampleData: ChallengeOO = {
          let instance = ChallengeOO()
    instance.challenge.append(Challenge(mood: .ansioso, name: "Meditar", summary: "A meditação", image: Image("meditation2")))
          return instance
      }()
  
  func getChallenge(mood: MoodType) {
    let filteredChallenges = Challenge.challengesData.filter { $0.mood == mood }
    challenge.append(filteredChallenges.randomElement()!) 
      }
}
