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
      let moods = MoodOO().moods
      
      GeometryReader(content: { geometry in
        ZStack(alignment: .bottom) {
        VStack(alignment: .center, spacing: nil, content: {
            HeaderView()
              .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 30, content: {
              ForEach(moods) { mood in
                MoodCard(moodImage: mood.image, humor: mood.name, descricao: mood.description, isSelected: isSelected)
              }
            })
            .padding(.top, -50)
          
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Continuar")
              .bold()
              .foregroundStyle(.text)
              .padding(.horizontal, 20)
              .padding(.vertical, 5)
          })
          .padding(.top, 40)
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.roundedRectangle(radius: 13))
        })
          }
        
      })
    }
}

#Preview {
    MoodView()
}
