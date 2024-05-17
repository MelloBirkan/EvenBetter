//
//  ChallengeView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 18/04/24.
//

import SwiftUI

struct ChallengeView: View {
  @Environment(\.modelContext) private var modelContext
  let atualChallenge: Challenge
  
  var body: some View {
    NavigationStack {
      GeometryReader { geometry in
        RoundedRectangle(cornerRadius: 25)
          .ignoresSafeArea()
          .foregroundStyle(.midRec)
          .frame(width: geometry.size.width, height: geometry.size.height / 104) // Adaptado para usar a largura disponível
        VStack(alignment: .leading) {
          Text("Atividade de hoje:")
            .foregroundStyle(.text)
            .bold()
            .font(.title3)
          
          CardView(challenge: atualChallenge)
          
          HStack {
            Spacer() // Adiciona espaço antes do botão para centralizá-lo horizontalmente
            ContinueButton(action: {
              modelContext.delete(atualChallenge)
            }, text: "Concluído")
            Spacer() // Adiciona espaço depois do botão para centralizá-lo horizontalmente
          }
          
        }
        .padding()
      }
      .navigationBarBackButtonHidden(true)
      .navigationTitle("Desafios")
      .navigationBarTitleDisplayMode(.large)
      .tint(.midRec)
      .background(Color.BG)
    }

  }
}

#Preview {
  NavigationStack {
    ChallengeView(atualChallenge: SampleDataChallenge.shared.challenge)
  }
}
