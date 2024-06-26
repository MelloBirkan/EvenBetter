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
  let name: String
  
  var body: some View {
    NavigationStack {
      GeometryReader(content: { geometry in
        ZStack(alignment: .bottom) {
          VStack(alignment: .center, spacing: nil, content: {
            ZStack(alignment: .leading) {
              WelcomeHeader()
                .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
              
              VStack(alignment: .leading, spacing: 20) {
                Text("Olá, \(name)")
                  .font(.title2)
                  .bold()
                  .offset(y: -60)
                
                Text("Como você está se sentindo hoje?")
                  .font(.title3)
                  .bold()
                
                Text("Selecione uma das opções abaixo.")
              }
              .foregroundStyle(.text)
              .padding()
            }
            
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
              ContinueButton {
                modelContext.insert(getChallenge(mood: moodSelected!.type))
              }
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
  MoodView(moodSelected: .constant(nil), name: "Convidado")
}
