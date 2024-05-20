//
//  MoodCard.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct MoodCard: View {
  let moodImage: Image
  let humor: String
  let descricao: String
  var isSelected: Bool
  
  var body: some View {
    ZStack(alignment: .leading) {
      RoundedRectangle(cornerRadius: 12)
        .frame(width: 112, height: 151)
        .foregroundStyle(.moodCard)
        .shadow(radius: 10)
      
      VStack(alignment: .leading) {
        moodImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50)
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .padding(.top)
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 4) {
          Text(humor)
            .foregroundStyle(.text)
            .bold()
          
          Text(descricao)
            .font(.caption2)
            .foregroundStyle(.secondary)
            .lineLimit(3)
            .frame(alignment: .leading)
          
          Spacer()
        }
      }
      .padding(.leading)
    }
    .overlay(isSelected ? RoundedRectangle(cornerRadius: 13)
                                        .stroke(lineWidth: 6)
                                        .foregroundStyle(.accent) : nil)
    .frame(width: 112, height: 151)
  }
}

#Preview {
  MoodCard(moodImage: Image(.triste), humor: "Triste", descricao: "Sem vontade de se movimentar", isSelected: false)
}
