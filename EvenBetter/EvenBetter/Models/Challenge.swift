//
//  Challenge.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI
import SwiftData

@Model
final class Challenge {
  let mood: MoodType
  let name: String
  let summary: String
  let image: String
  
  init(mood: MoodType, name: String, summary: String, image: String) {
    self.mood = mood
    self.name = name
    self.summary = summary
    self.image = image
  }
  
  static let sampleData = Challenge(mood: .ansioso, name: "Meditar", summary: "A meditação", image: "meditation2")
  
  static let challengesData = [
          Challenge(mood: .feliz, name: "Gratidão", summary: "Escreva 3 coisas pelas quais você é grato hoje", image: "writing"),
          Challenge(mood: .feliz, name: "Dança", summary: "Dance sua música favorita por alguns minutos", image: "dancing"),
          Challenge(mood: .triste, name: "Conversa", summary: "Ligue para um amigo ou familiar e desabafe", image: "phone"),
          Challenge(mood: .triste, name: "Filme", summary: "Assista a um filme de comédia ou que te faça sentir bem", image: "movie"),
          Challenge(mood: .ansioso, name: "Respiração", summary: "Faça exercícios de respiração profunda por 5 minutos", image: "meditation2"),
          Challenge(mood: .ansioso, name: "Caminhada", summary: "Faça uma caminhada relaxante ao ar livre", image: "walking"),
          Challenge(mood: .motivado, name: "Meta", summary: "Defina uma meta pessoal e planeje passos para alcançá-la", image: "target"),
          Challenge(mood: .motivado, name: "Aprendizado", summary: "Aprenda algo novo sobre um tópico que te interessa", image: "learning"),
          Challenge(mood: .bravo, name: "Pausa", summary: "Faça uma pausa, respire fundo e pense antes de reagir", image: "stopSign"),
          Challenge(mood: .bravo, name: "Exercício", summary: "Faça exercícios físicos para liberar a tensão", image: "exercise"),
          Challenge(mood: .cansado, name: "Descanso", summary: "Tire uma soneca de 20 minutos ou relaxe ouvindo música calma", image: "sleeping"),
          Challenge(mood: .cansado, name: "Alongamento", summary: "Faça alguns alongamentos suaves para energizar o corpo", image: "stretching"),
          Challenge(mood: .ansioso, name: "Yoga", summary: "Faça uma sessão de yoga de 15 minutos para acalmar a mente e o corpo", image: "yoga"),
          Challenge(mood: .motivado, name: "Corrida", summary: "Faça uma corrida de 20 minutos para energizar o corpo e a mente", image: "running")
      ]
}
