//
//  PlayerView.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 09/03/24.
//

import SwiftUI

struct PlayerView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var audioManager: AudioManager
  var OO: MeditationOO
  var isPreview = false
  @State private var value = 0.0
  @State private var isEditing: Bool = false
  
  let timer = Timer.publish(every: 0.5, on: .main, in: .common)
    .autoconnect()
  
  var body: some View {
    ZStack {
      OO.meditation.image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: UIScreen.main.bounds.width)
        .padding(.leading, 28)
        .ignoresSafeArea()
      
      Rectangle()
        .background(.thinMaterial)
        .opacity(0.05)
        .ignoresSafeArea()
      
      VStack(spacing: 32, content: {
        HStack {
          Button(action: {
            dismiss()
            audioManager.stop()
          }, label: {
            Image(systemName: "xmark.circle.fill")
              .font(.system(size: 36))
              .foregroundStyle(.white)
          })
          
          Spacer()
        }
        
        Text(OO.meditation.title)
          .font(.title)
          .foregroundStyle(.white) // Possivel mudança de cor
          .background(
            RoundedRectangle(cornerRadius: 12)
              .foregroundStyle(.white)
              .opacity(0.2)
              .blur(radius: 20)
          )
        
        Spacer()
        
        if let player = audioManager.player {
          VStack(spacing: 5, content: {
            Slider(value: $value, in: 0...player.duration) { editing in
              isEditing = editing
              if !editing {
                player.currentTime = value
              }
            }
            .tint(.accent)
            
            HStack {
              Text(DateComponentsFormatter.positional.string(from:player.currentTime) ?? "0:00")
              
              Spacer()
              
              Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
            }
            .font(.caption)
            .foregroundStyle(.accent)
            
            HStack {
              PlaybackControlButton(systemName: audioManager.isLooping ? "repeat.circle.fill" : "repeat.circle") {
                audioManager.toggleLoop()
              }
              
              Spacer()
              
              PlaybackControlButton(systemName: "gobackward.10") {
                player.currentTime -= 10
              }
              
              Spacer()
              
              PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                audioManager.playPause()
              }
              
              Spacer()
              
              PlaybackControlButton(systemName: "goforward.10") {
                player.currentTime += 10
              }
              
              Spacer()
              
              PlaybackControlButton(systemName: "stop.fill") {
                audioManager.stop()
              }
            }
          })
          .padding()
          .background(.ultraThinMaterial)
          .clipShape(RoundedRectangle(cornerRadius: 18))
        }
      })
      
      .padding(20)
    }
    .onAppear {
      audioManager.startPlayer(track: OO.meditation.track, isPreview: isPreview)
    }
    .onReceive(timer) { _ in
      guard let player = audioManager.player, !isEditing else { return }
      value = player.currentTime
    }
  }
}

#Preview {
  let meditationOO = MeditationOO(meditation: MeditationDO.data)
  return PlayerView(OO: meditationOO, isPreview: true)
    .environmentObject(AudioManager())
}

extension DateComponentsFormatter {
  static let positional: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter
  }()
}
