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

