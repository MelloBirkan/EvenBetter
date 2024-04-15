//
//  AddTaskButton.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 11/04/24.
//

import SwiftUI

struct AddTaskButton: View {
  let action: () -> Void
    var body: some View {
      Button(action: {
      action()
      }, label: {
        Image(systemName: "plus.circle.fill")
          .foregroundStyle(.text)
          .font(.system(size: 45))
      })
    }
}

#Preview {
  AddTaskButton {
    ()
  }
}
