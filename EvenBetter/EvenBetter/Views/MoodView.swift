//
//  MoodCard.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct MoodView: View {
  @Binding var moodSelected: Mood?
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    NavigationStack {
      GeometryReader(content: { geometry in
        ZStack(alignment: .bottom) {
          VStack(alignment: .center, spacing: nil, content: {
            WelcomeHeader()
              .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 30, content: {
              ForEach(Mood.moodsDataToDisplay) { mood in
                MoodCard(moodImage: mood.image, humor: mood.name, descricao: mood.description, isSelected: mood == moodSelected)
                  .onTapGesture {
                    withAnimation {
                      moodSelected = mood
                    }
                  }
              }
            })
            .padding(.horizontal)
            .padding(.top, -50)
            
            if (moodSelected != nil) {
              Button(action: {
                //                TODO: Fazer salvar mood aqui colocar um desafio dentro do array
                modelContext.insert(getChallenge(mood: moodSelected!.type))
              }, label: {
                Text("Continuar")
                  .bold()
                  .foregroundStyle(.text)
                  .padding(.horizontal, 20)
                  .padding(.vertical, 5)
              })
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
  func getChallenge(mood: MoodType) -> Challenge {
    let filteredChallenges = Challenge.challengesData.filter { $0.mood == mood }
    return filteredChallenges.randomElement()!
      }
}

#Preview {
  MoodView(moodSelected: .constant(nil))
}
