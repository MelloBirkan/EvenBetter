//
//  MeditationView.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 08/03/24.
//

import SwiftUI

struct MeditationView: View {
  var meditation: MeditationDO
  @State private var showPlayer = false
  
    var body: some View {
      VStack(spacing: 0) {
        meditation.image
          .resizable()
          .scaledToFill()
//          .frame(height: UIScreen.main.bounds.height / 1.2)
        
        ZStack {
          Color(.BG)
          
          VStack(alignment: .leading, spacing: 24, content: {
            
            VStack(alignment: .leading, spacing: 8, content: {
              Text("Music")
              
              Text(meditation.duration.formatted() + "S")
            })
            .font(.subheadline)
            .textCase(.uppercase)
            .opacity(0.7)
            .foregroundStyle(.secondary)
            
            Text(meditation.title)
              .font(.title)
            
            Button(action: {
              showPlayer = true
            }, label: {
              Label("Play", systemImage: "play.fill")
                .font(.headline)
                .foregroundStyle(.text)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            
            Text(meditation.description)
            
            
            Spacer()
          })
          .foregroundStyle(.primary)
          .padding(20)
        }
        .frame(height: UIScreen.main.bounds.height * 2 / 3)
      }
      .ignoresSafeArea()
      .fullScreenCover(isPresented: $showPlayer) {
        PlayerView(meditationDo: meditation)
      }
    }
}

#Preview {
  MeditationView(meditation: MeditationDO.sampleData)
    .environmentObject(AudioManager())
}
