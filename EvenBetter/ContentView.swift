//
//  ContentView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 09/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        Rectangle()
          .foregroundStyle(.mainRec)
          .frame(width: 430, height: 425)
        
        VStack(alignment: .leading, spacing: 20) {
          Text("Como você está se sentindo hoje?")
            .bold()
            .font(.title3)
          
          Text("Selecione uma das opções abaixo.")
            .font(.callout)
        }
        .offset(x: -30, y: 50)
        
        HStack(alignment: .top, spacing: 0) {
          ZStack {
            Rectangle()
              .foregroundStyle(.leftRec)
              .frame(width: 249, height: 183)
              
            Text("Olá, Marcello")
              .font(.title2)
              .foregroundStyle(.text)
              .bold()
              .offset(x: -30, y: 50)
          }
          Rectangle()
            .foregroundStyle(.midRec)
            .frame(width: 141, height: 183)
          
          Rectangle()
            .foregroundStyle(.rightRec)
            .frame(width: 40, height: 425)
        }
      }
      
    }
}

#Preview {
    ContentView()
}
