//
//  AddTaskButton.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 11/04/24.
//

import SwiftUI

struct AddTaskButton: View {
  let action: () -> Void
  @State var buttonTapped = false
    var body: some View {
      Button(action: {
      action()
        self.buttonTapped.toggle()
      }, label: {
        Image(systemName: "plus.circle.fill")
          .foregroundStyle(.text)
          .font(.system(size: 45))
          .symbolEffect(.bounce, value: buttonTapped)
      })
    }
}

#Preview {
  AddTaskButton {
    ()
  }
}
