//
//  MoodOO.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

@Observable
final class MoodOO {
  let moods: [Mood] = [
    Mood(type: MoodType.feliz, description: "Sem vontade de se movimentar", image: Image(.feliz)),
    Mood(type: MoodType.triste, description: "Sem vontade de se movimentar", image: Image(.triste)),
    Mood(type: MoodType.ansioso, description: "Sem vontade de se movimentar", image: Image(.ansioso)),
    Mood(type: MoodType.motivado, description: "Sem vontade de se movimentar", image: Image(.motivado)),
    Mood(type: MoodType.bravo, description: "Sem vontade de se movimentar", image: Image(.bravo)),
    Mood(type: MoodType.cansado, description: "Sem vontade de se movimentar", image: Image(.cansado)),
  ]
}
