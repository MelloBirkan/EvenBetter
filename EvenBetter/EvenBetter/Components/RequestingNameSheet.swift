//
//  RequestingNameSheet.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 17/05/24.
//

import SwiftUI

struct RequestingNameSheet: View {
    @Binding var isShowingNameSheet: Bool
    @Binding var hasSeenNameSheet: Bool
    @Binding var name: String
    
    var body: some View {
        ZStack {
            WelcomeHeader()
            
            RoundedRectangle(cornerRadius: 20)
                .ignoresSafeArea()
                .foregroundStyle(Material.ultraThin)
            
            VStack {
                Text("Bem-Vindo ao EvenBetter")
                    .font(.title)
                    .bold()
                
                HStack {
                    Text("Insira seu nome:")
                    Spacer()
                    TextField("Nome", text: $name)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
                .font(.title2)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(Material.thin)
                )
                
                ContinueButton {
                    hasSeenNameSheet = true
                    isShowingNameSheet = false
                }
                
                Spacer()
            }
            .foregroundStyle(.text)
            .padding()
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    RequestingNameSheet(isShowingNameSheet: .constant(true), hasSeenNameSheet: .constant(false), name: .constant("Marcello"))
}

