//
//  MeditationViewModel.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 09/03/24.
//

import SwiftUI

@Observable
final class MeditationOO {
  var meditation: MeditationDO
  
  init(meditation: MeditationDO) {
    self.meditation = meditation
  }
}

struct MeditationDO {
  let id = UUID()
  let title: String
  let description: String
  let duration: TimeInterval
  let track: String
  let image: Image
  
  static let data = MeditationDO(title: "1 Minute Relaxing Meditation", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 70, track: "ages-ago", image: Image(.meditation2))
}
