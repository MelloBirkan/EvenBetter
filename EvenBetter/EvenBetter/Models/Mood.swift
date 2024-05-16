//
//  Mood.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

enum MoodType: String, Codable {
  case feliz = "Feliz"
  case triste = "Triste"
  case ansioso = "Ansioso"
  case motivado = "Motivado"
  case bravo = "Bravo"
  case cansado = "Cansado"
  case all
}

struct Mood: Identifiable, Equatable {
  let id = UUID()
  let type: MoodType
  var name: String {
    return self.type.rawValue
  }
  let description: String
  let image: Image
  
  static let moodsDataToDisplay: [Mood] = [
    Mood(type: MoodType.feliz, description: "Sem vontade de se movimentar", image: Image(.feliz)),
    Mood(type: MoodType.triste, description: "Sem vontade de se movimentar", image: Image(.triste)),
    Mood(type: MoodType.ansioso, description: "Sem vontade de se movimentar", image: Image(.ansioso)),
    Mood(type: MoodType.motivado, description: "Sem vontade de se movimentar", image: Image(.motivado)),
    Mood(type: MoodType.bravo, description: "Sem vontade de se movimentar", image: Image(.bravo)),
    Mood(type: MoodType.cansado, description: "Sem vontade de se movimentar", image: Image(.cansado)),
  ]
}
