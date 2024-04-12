//
//  TaskView.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
  @Query private var tasks: [TaskModel]
  @State var isPresented = false
  
  var body: some View {
    VStack {
      ZStack(alignment: .top) {
        RoundedRectangle(cornerRadius: 25)
          .frame(width: 430, height: 139).ignoresSafeArea()
          .foregroundStyle(.mainRec)
        
        HStack {
          Text("Taréfas")
            .font(.largeTitle)
            .bold()
          
          Spacer()
          
          AddTaskButton(isVisible: $isPresented)
        }
        .padding()
      }
      
      ForEach(tasks) { task in
        TaskRow(title: task.title, summary: task.summary, hour: task.hour)
        
          .sheet(isPresented: $isPresented, content: {
            AddTaskView()
          })
      }
      Spacer()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .sheet(isPresented: $isPresented, content: {
        AddTaskView()
      })
    }
  }
}

#Preview {
  let container = try! ModelContainer(for: TaskModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
  
  container.mainContext.insert(TaskModel(title: "Tomar banho"))
  return TaskView()
    .modelContainer(container)
}
