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
      MeditationDO(title: "Ages Ago", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "ages-ago", image: Image(.meditation2)),
      MeditationDO(title: "Hometown", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "hometown", image: Image(.hometown)),
      MeditationDO(title: "Fireflies", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "fireflies", image: Image(.fireflies)),
      MeditationDO(title: "Sky High", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "sky-high", image: Image(.highSky))



    ]
  }
}

