//
//  SwiftUIView.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskRow: View {
  @Environment(\.colorScheme) var colorScheme
  let task: TaskModel
  @State var expandida = false
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 18)
        .shadow(radius: 1.5)
        .foregroundStyle(task.isCompleted ? Color.secondary : Color(task.color))
      
      VStack {
        HStack(alignment: expandida ? .top : .center) {
          Rectangle()
            .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 18, bottomLeading: 18, bottomTrailing: 0, topTrailing: 0)))
            .foregroundStyle(task.isCompleted ? Color.secondary : colorScheme == .dark ? Color.text.opacity(0.8) : Color(task.color).darkened())
            .frame(width: 18)
          
          Image(systemName: task.isCompleted ? "checkmark.circle" : "circle.fill")
            .foregroundStyle(.white)
            .font(.title)
            .overlay {
              if !task.isCompleted {
                Circle()
                  .stroke(lineWidth: 2)
              }
            }
            .padding(.top, expandida ? 20 : 0)
            .onTapGesture {
              withAnimation {
                task.isCompleted.toggle()
              }
            }
          
          VStack(alignment: .leading, spacing: 20) {
            if task.summary == ""  {
              Text(task.title)
                .foregroundStyle(task.isCompleted ? Color.white : .text)
            } else {
              Text(task.title)
                .offset(y: expandida ? 0 : 18)
                .foregroundStyle(task.isCompleted ? Color.white : .text)
            }
            
            if task.summary != ""  {
              Text(task.summary)
                .foregroundStyle(task.isCompleted ? Color.white : .text)
                .padding(.leading)
                
                .opacity(expandida ? 1 : 0)
                .animation(.easeOut, value: expandida)
            }
          }
          .padding(.top, expandida ? 25 : 0)
          
          Spacer()
          
          VStack(spacing: 10) {
            Text("\(task.hour.formatted(.dateTime.hour().minute()))")
              .foregroundStyle(task.isCompleted ? Color.white : .text)
            
            Image(systemName: expandida ? "chevron.down" : "chevron.forward")
              .foregroundStyle(task.isCompleted ? Color.white : .secondary)
              .fontWeight(.semibold)
              .padding(.leading)
              .contentTransition(.symbolEffect)
              .animation(.bouncy, value: expandida)
          }
          .padding(.top, expandida ? 20 : 0)
          .padding(.trailing)
        }
      }
    }
    .onTapGesture {
      withAnimation(.spring()) {
        expandida.toggle()
      }
    }
    .frame(width: 382, height: expandida ? 198 : 71)
  }
}



#Preview {
  return TaskRow(task: SampleData.shared.task)
    .modelContainer(SampleData.shared.modelContainer)
}
