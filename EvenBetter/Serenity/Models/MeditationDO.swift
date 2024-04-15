//
//  MeditationDO.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 15/04/24.
//

import SwiftUI

struct MeditationDO {
  let id = UUID()
  let title: String
  let description: String
  let duration: TimeInterval
  let track: String
  let image: Image
  
  static let data = MeditationDO(title: "Ages ago", description: "Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 300, track: "ages-ago", image: Image(.meditation2))
}
