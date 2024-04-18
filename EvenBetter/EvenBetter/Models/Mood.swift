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
}

struct Mood {
  let type: MoodType
  let name: MoodType.RawValue
  let description: String
}