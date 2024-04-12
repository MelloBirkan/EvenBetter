//
//  PlaybackControlButton.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 09/03/24.
//

import SwiftUI

struct PlaybackControlButton: View {
  var systemName: String = "play"
  var fontSize: CGFloat = 24
  var action: () -> Void
  var color: Color = .accent
  
    var body: some View {
      Button(action: {
        action()
      }, label: {
        Image(systemName: systemName)
          .font(.system(size: fontSize))
          .foregroundStyle(color)
          .contentTransition(.symbolEffect(.replace))
      })
    }
}

#Preview {
  PlaybackControlButton(action: {})
}
