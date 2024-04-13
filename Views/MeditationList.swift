//
//  MeditationList.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 31/03/24.
//

import SwiftUI

struct MeditationList: View {
  @State var OO: MeditationOO
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        HeaderView(informationIsVisible: false).frame(height: 5)
        Text("Selecione uma das opções abaixo.")
          .foregroundStyle(.text)
          .padding([.top, .leading])
        
        ScrollView(showsIndicators: false){
          LazyVGrid(columns: [GridItem(), GridItem()], content: {
            NavigationLink(destination: MeditationView(meditationOO: OO)) {
              VStack(spacing: 0) {
                OO.meditation.image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 0, bottomTrailing: 0, topTrailing: 12)))
                
                HStack(spacing: 0) {
                  Text(OO.meditation.title)
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
            }
          })
          .padding()
        }
      }
      Spacer()
      .navigationTitle("Meditações")
    }
    .tint(.accent)
  }
}

#Preview {
  let meditationOO = MeditationOO(meditation: MeditationDO.data)
  return MeditationList(OO: meditationOO)
}
