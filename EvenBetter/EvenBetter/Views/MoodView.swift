//
//  MoodCard.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct MoodView: View {
    var body: some View {
      @State var isSelected = false
      
      GeometryReader(content: { geometry in
        ZStack(alignment: .bottom) {
        VStack(alignment: .center, spacing: nil, content: {
            HeaderView()
              .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 30, content: {
              MoodCard(moodImage: Image(.feliz), humor: "Feiz", descricao: "Sem vontade de se movimentar")
              MoodCard(moodImage: Image(.triste), humor: "Triste", descricao: "Sem vontade de se movimentar")
              MoodCard(moodImage: Image(.ansioso), humor: "Ansioso", descricao: "Sem vontade de se movimentar")
              MoodCard(moodImage: Image(.motivado), humor: "Motivado", descricao: "Sem vontade de se movimentar")
              MoodCard(moodImage: Image(.bravo), humor: "Bravo", descricao: "Sem vontade de se movimentar")
              MoodCard(moodImage: Image(.cansado), humor: "Cansado", descricao: "Sem vontade de se movimentar")
            })
            .padding(.top, -50)
        })
          }
        
      })
    }
}

#Preview {
    MoodView()
}
