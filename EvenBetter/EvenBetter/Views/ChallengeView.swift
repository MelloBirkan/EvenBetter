//
//  ChallengeView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct ChallengeView: View {
    var body: some View {
      GeometryReader { geometry in
          RoundedRectangle(cornerRadius: 25)
            .ignoresSafeArea()
            .foregroundStyle(.midRec)
            .frame(width: geometry.size.width, height: geometry.size.height / 104) // Adaptado para usar a largura disponível
        VStack(alignment: .leading) {
          Text("Atividade de hoje:")
            .foregroundStyle(.text)
            .bold()
            .font(.largeTitle)
        }
        .padding()
      }
      .navigationBarBackButtonHidden(true)
      .navigationTitle("Desafios")
    }
}

#Preview {
  NavigationStack {
    ChallengeView()
  }
}
