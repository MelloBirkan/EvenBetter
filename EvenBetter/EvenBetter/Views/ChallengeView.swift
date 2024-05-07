//
//  ChallengeView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct ChallengeView: View {
  @Binding var atualChallenge: ChallengeOO
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
          if !atualChallenge.challenge.isEmpty {
            CardView(challenge: atualChallenge.challenge[0]) {
              //            TODO: Resolver problema
              atualChallenge.challenge.remove(at: 0)
            }
          }
        }
        .padding()
      }
      .navigationBarBackButtonHidden(true)
      .navigationTitle("Desafios")
      .navigationBarTitleDisplayMode(.large)
      .tint(.midRec)
    }
}

#Preview {
  NavigationStack {
    ChallengeView(atualChallenge: .constant(ChallengeOO()))
  }
}
