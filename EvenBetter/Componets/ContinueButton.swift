//
//  ContinueButton.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 16/05/24.
//

import SwiftUI

struct ContinueButton: View {
  let action: () -> Void
  let text: String 
  
  init(action: @escaping () -> Void, text: String = "Continuar") {
    self.action = action
    self.text = text
  }
  
    var body: some View {
      Button(action: {
        action()
      }, label: {
        Text(text)
          .bold()
          .foregroundStyle(.text)
          .padding(.horizontal, 20)
          .padding(.vertical, 5)
      })
      .padding(.top, 40)
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.roundedRectangle(radius: 13))
      .tint(.accent)
    }
}

#Preview {
  ContinueButton(action: {
    
  }, text: "Continuar")
}
