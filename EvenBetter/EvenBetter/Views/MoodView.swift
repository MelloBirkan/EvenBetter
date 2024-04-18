//
//  MoodCard.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct MoodView: View {
  @State var moodSelected: Mood?
  let moods = MoodOO().moods

    var body: some View {
      NavigationStack {
        GeometryReader(content: { geometry in
          ZStack(alignment: .bottom) {
          VStack(alignment: .center, spacing: nil, content: {
              HeaderView()
                .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
              
              LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 30, content: {
                ForEach(moods) { mood in
                    MoodCard(moodImage: mood.image, humor: mood.name, descricao: mood.description, isSelected: mood == moodSelected)
                    .onTapGesture {
                      withAnimation {
                        moodSelected = mood
                      }
                    }
                }
              })
              .padding(.top, -50)
            
            if (moodSelected != nil) {
              NavigationLink(destination: ContentView()) {
                Text("Continuar")
                  .bold()
                  .foregroundStyle(.text)
                  .padding(.horizontal, 20)
                  .padding(.vertical, 5)
              }
              .padding(.top, 40)
              .buttonStyle(.borderedProminent)
              .buttonBorderShape(.roundedRectangle(radius: 13))
              .tint(.accent)
            }
          })
            }
          
        })
        .background(Color.BG)
      }

    }
}

#Preview {
    MoodView()
}
