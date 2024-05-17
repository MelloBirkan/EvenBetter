//
//  CardView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 01/05/24.
//

import SwiftUI

struct CardView: View {
  var challenge: Challenge
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0, content: {
      AsyncImage(url: URL(string: challenge.image)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 13, bottomLeading: 0, bottomTrailing: 0, topTrailing: 13)))
      } placeholder: {
        HStack {
          Spacer() // Adiciona espaço antes do botão para centralizá-lo horizontalmente
          ProgressView()
            .frame(height: 360)
          Spacer() // Adiciona espaço depois do botão para centralizá-lo horizontalmente
        }
      }
      
      ZStack {
        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 13, bottomTrailing: 13, topTrailing: 0))
          .foregroundStyle(.moodCard)
          .shadow(radius: 10)
          .frame(height: 100)
        
        VStack(alignment: .leading, spacing: 15) {
          Text(challenge.name)
            .foregroundStyle(.text)
            .font(.title2)
            .bold()
          
          Text(challenge.summary)
        }
      }
    })
  }
}

#Preview {
  CardView(challenge: SampleDataChallenge.shared.challenge)
    .modelContainer(SampleDataChallenge.shared.modelContainer)
}
