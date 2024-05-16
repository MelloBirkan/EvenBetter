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
          Challenge(mood: .feliz, name: "Gratidão", summary: "Escreva 3 coisas pelas quais você é grato hoje", image: "https://cdn.midjourney.com/819f55a7-ff0b-4d8c-b17a-8221892f001b/0_0.png"),
          Challenge(mood: .feliz, name: "Dança", summary: "Dance sua música favorita por alguns minutos", image: "https://cdn.midjourney.com/5325e4ec-dde1-4564-a025-687a7a090d40/0_0.png"),
          Challenge(mood: .triste, name: "Conversa", summary: "Ligue para um amigo ou familiar e desabafe", image: "https://cdn.midjourney.com/210afbee-e56f-4285-9f2d-bd1054db3f20/0_0.png"),
          Challenge(mood: .triste, name: "Filme", summary: "Assista a um filme de comédia ou que te faça sentir bem", image: "https://cdn.midjourney.com/9df0088f-a342-4474-a469-a8d6107f420f/0_0.png"),
          Challenge(mood: .ansioso, name: "Respiração", summary: "Faça exercícios de respiração profunda por 5 minutos", image: "https://cdn.midjourney.com/a8a6fb18-2506-4326-8099-e5efa9f08fbc/0_0.png"),
          Challenge(mood: .ansioso, name: "Caminhada", summary: "Faça uma caminhada relaxante ao ar livre", image: "https://cdn.midjourney.com/19b1d6de-e8cd-4639-969e-817b81efeda9/0_0.png"),
          Challenge(mood: .motivado, name: "Meta", summary: "Defina uma meta pessoal e planeje passos para alcançá-la", image: "https://cdn.midjourney.com/3a21a20b-de0b-414f-902d-e116908b6551/0_0.png"),
          Challenge(mood: .motivado, name: "Aprendizado", summary: "Aprenda algo novo sobre um tópico que te interessa", image: "https://cdn.midjourney.com/9100881c-fc95-48e2-b133-b9c8d1b46cd8/0_0.png"),
          Challenge(mood: .bravo, name: "Pausa", summary: "Faça uma pausa, respire fundo e pense antes de reagir", image: "https://cdn.midjourney.com/074ea1d9-e7e5-4e00-baa8-5ea19f4c5cf3/0_0.png"),
          Challenge(mood: .bravo, name: "Exercício", summary: "Faça exercícios físicos para liberar a tensão", image: "exercise"),
          Challenge(mood: .cansado, name: "Descanso", summary: "Tire uma soneca de 20 minutos ou relaxe ouvindo música calma", image: "sleeping"),
          Challenge(mood: .cansado, name: "Alongamento", summary: "Faça alguns alongamentos suaves para energizar o corpo", image: "https://cdn.midjourney.com/262d664b-7fab-4658-8021-2975eb95a090/0_0.png"),
          Challenge(mood: .ansioso, name: "Yoga", summary: "Faça uma sessão de yoga de 15 minutos para acalmar a mente e o corpo", image: "https://cdn.midjourney.com/a59e6c2b-4765-41db-81df-0e9d94d16fc8/0_0.png"),
          Challenge(mood: .motivado, name: "Corrida", summary: "Faça uma corrida de 20 minutos para energizar o corpo e a mente", image: "https://cdn.midjourney.com/92ca24ec-9598-4b09-ac8e-583cc2fc9531/0_0.png")
      ]
}
