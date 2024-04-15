//
//  MeditationViewModel.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 09/03/24.
//

import SwiftUI

@Observable
final class MeditationOO {
 var meditations = [MeditationDO]()
  
 static var sampleData: MeditationOO {
    let instance = MeditationOO()
    instance.meditations = [
      MeditationDO(title: "Ages ago", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "ages-ago", image: Image(.meditation2)),
      MeditationDO(title: "Ages ago", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "ages-ago", image: Image(.meditation2))
    ]
    return instance
 }

  
  func fetch() {
    meditations = [
      MeditationDO(title: "Ages ago", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "ages-ago", image: Image(.meditation2))
    ]
  }
}

