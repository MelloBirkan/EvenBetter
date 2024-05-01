//
//  Mood.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

enum MoodType: String {
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
}
