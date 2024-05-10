//
//  CardView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 01/05/24.
//

import SwiftUI

struct CardView: View {
  var challenge: Challenge
  let action: () -> Void
  var body: some View {
    VStack {
      VStack {
        Text(challenge.name).font(.headline)
          .offset(y: -10)
      }
      .padding()
      .frame(maxWidth: .infinity)
      .frame(height: 70)
      .background(
        Rectangle().fill(.ultraThinMaterial)
          .blur(radius: 20)
          .offset(y: -20)
      )
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(challenge.image.resizable().aspectRatio(contentMode: .fill))
    .frame(height: 300)
    .cornerRadius(20)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
    )
    .overlay(
      VStack {
        Text(challenge.summary)
          .font(.subheadline)
        
        Spacer()
        
        HStack(spacing: 10) {
          VStack(alignment: .leading) {
            Text("Tipo").font(.subheadline).foregroundStyle(.secondary)
            Text(challenge.mood.rawValue)
          }
          Divider()
          VStack(alignment: .leading) {
            Text("Data").font(.subheadline).foregroundStyle(.secondary)
            Text("Hoje")
          }
          Divider()
          VStack(alignment: .leading) {
            Text("Data").font(.subheadline).foregroundStyle(.secondary)
            Text("Hoje")
          }
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .offset(y: 10)
        
        Button {
          action()
        } label: {
          HStack {
            HStack {
              Image(systemName: "play")
            }
            .padding()
            .frame(height: 44)
            .background(.linearGradient(colors: [.clear, .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .cornerRadius(20)
          }
//          .onLongPressGesture {
//            action()
//          }
        }
        
      }
        .frame(height: 140)
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .offset(y: 80)
        .padding(20)
    )
  }
}


#Preview {
  CardView(challenge: Challenge.sampleData) {
    
  }
}
