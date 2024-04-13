//
//  ContentView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 09/04/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundStyle(.mainRec)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Como você está se sentindo hoje?")
                        .bold()
                        .font(.title3)
                    
                    Text("Selecione uma das opções abaixo.")
                        .font(.callout)
                }
                .offset(x: -geometry.size.width * 0.07, y: geometry.size.height * 0.06)
                
                HStack(alignment: .top, spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.leftRec)
                            .frame(width: geometry.size.width * 0.58, height: geometry.size.height * 0.21)
                        
                        Text("Olá, Marcello")
                            .font(.title2)
                            .foregroundStyle(.text)
                            .bold()
                            .offset(x: -geometry.size.width * 0.07, y: geometry.size.height * 0.06)
                    }
                    Rectangle()
                        .foregroundStyle(.midRec)
                        .frame(width: geometry.size.width * 0.33, height: geometry.size.height * 0.21)
                    
                    Rectangle()
                        .foregroundStyle(.rightRec)
                        .frame(width: geometry.size.width * 0.09, height: geometry.size.height * 0.5)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HeaderView()
}
