//
//  MeditationCard.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 16/04/24.
//

import SwiftUI

struct MeditationCard: View {
  let image: Image
  let title: String
  
    var body: some View {
      VStack(spacing: 0) {
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
          .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 0, bottomTrailing: 0, topTrailing: 12)))
        
        HStack(spacing: 0) {
          Text(title)
            .foregroundStyle(.white)
            .lineLimit(1)
          
          Spacer()
          
          Image(systemName: "play.circle.fill")
            .foregroundStyle(.white)
            .scaleEffect(1.3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background {Color.accent}
        .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 12, bottomTrailing: 12, topTrailing: 0)))
      }
      .shadow(radius: 10)
    }
}

#Preview {
  MeditationCard(image: Image(.meditation2
                             ), title: "Meditação")
}
