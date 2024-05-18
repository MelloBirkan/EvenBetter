//
//  ContentView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 09/04/24.
//

import SwiftUI

struct WelcomeHeader: View {
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        RoundedRectangle(cornerRadius: 25.0)
          .foregroundStyle(.mainRec)
          .frame(width: geometry.size.width, height: geometry.size.height) // Altura total do geometry
        
        HStack(alignment: .top, spacing: 0) {
          ZStack(alignment: .topLeading) {
            Rectangle()
              .foregroundStyle(.leftRec)
              .frame(width: geometry.size.width * 0.58, height: geometry.size.height * 0.43)
          }
          Rectangle()
            .foregroundStyle(.midRec)
            .frame(width: geometry.size.width * 0.33, height: geometry.size.height * 0.43)
          
          Rectangle()
            .foregroundStyle(.accent)
            .frame(width: geometry.size.width * 0.1, height: geometry.size.height)
            .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 0, bottomTrailing: 25, topTrailing: 0)))
        }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  WelcomeHeader()
}
