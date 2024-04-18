//
//  MeditationList.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 31/03/24.
//

import SwiftUI

struct MeditationList: View {
  @State var meditations: MeditationOO = MeditationOO()
  
  var body: some View {
    GeometryReader { geometry in
      NavigationStack {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25)
              .ignoresSafeArea()
              .frame(width: geometry.size.width, height: geometry.size.height / 104) // Adaptado para usar a largura disponível
              .foregroundStyle(.rightRec)
            
            Text("Selecione uma das opções abaixo.")
              .foregroundStyle(.text)
              .padding([.top, .leading])
            
            ScrollView(showsIndicators: false){
              LazyVGrid(columns: [GridItem(), GridItem()], content: {
                ForEach(meditations.meditations) { meditation in
                  NavigationLink(destination: MeditationView(meditation: meditation)) {
                    MeditationCard(image: meditation.image, title: meditation.title)
                  }
                }
              })
              .padding()
            }
          Spacer()
            .navigationTitle("Meditações")
        }
        .tint(.accent)
        .onAppear(perform: {
          meditations.fetch()
        })
        .refreshable {
          meditations.fetch()
        }
      }
    }
  }
}

#Preview {
  MeditationList()
}
