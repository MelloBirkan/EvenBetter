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
      ZStack {
        Group {
          Button(action: {
            action()
          }) {
            Image(systemName: "calendar.circle.fill")
              .foregroundStyle(.text)
              .font(.system(size: 45))
              .padding(24)
              .rotationEffect(Angle.degrees(buttonTapped ? 0 : 90))
          }
          .offset(x: buttonTapped ? -30 : 0, y: buttonTapped ? -55 : 0)
          .opacity(buttonTapped ? 1 : 0)
          
          Button(action: {
            action()
          }) {
            Image(systemName: "hourglass.circle.fill")
              .foregroundStyle(.text)
              .font(.system(size: 45))
              .padding(24)
              .rotationEffect(Angle.degrees(buttonTapped ? 0 : 90))
          }
          .offset(x: buttonTapped ? -60 : 0, y: 0)
          .opacity(buttonTapped ? 1 : 0)
          
          Button(action: {
            self.buttonTapped.toggle()
          }, label: {
            Image(systemName: "plus.circle.fill")
              .foregroundStyle(.text)
              .font(.system(size: 45))
              .rotationEffect(Angle(degrees: buttonTapped ? 45 : 0))
              .symbolEffect(.bounce, value: buttonTapped)
          })
        }
        .tint(.white)
      .animation(.default, value: buttonTapped)
      }
    }
}

#Preview {
  AddTaskButton {
    ()
  }
}
