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
  @State var isSelected: Bool = false
  
    var body: some View {
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 12)
            .frame(width: 112, height: 151)
            .foregroundStyle(.white)
            .shadow(radius: 10)
          
          VStack(alignment: .leading) {
            moodImage
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 54)
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .padding(.top)
            
            Spacer()
            
            Text(humor)
              .foregroundStyle(.text)
              .bold()
              .padding(.bottom, 1)
            
            Text(descricao)
              .font(.caption2)
              .foregroundStyle(.gray)
              .foregroundStyle(.secondary)
              .padding(.bottom)
          }
          .frame(width: 112, height: 151)
          .overlay {
            if isSelected {
              RoundedRectangle(cornerRadius: 13)
                .stroke(lineWidth: 6)
                .foregroundStyle(.accent)
            }
          }
        }
        .onTapGesture {
          withAnimation {
            isSelected.toggle()
          }
        }
    }
}

#Preview {
  MoodCard(moodImage: Image(.triste), humor: "Triste", descricao: "Sem vontade de se movimentar")
}
