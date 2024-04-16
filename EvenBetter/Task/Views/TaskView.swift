//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var tasks: [TaskModel]
  @State private var newTask: TaskModel?
  @State var taskBeingEdited: TaskModel?
  
  var body: some View {
    
    GeometryReader { geometry in
      VStack {
        ZStack(alignment: .bottom) {
          RoundedRectangle(cornerRadius: 25)
            .ignoresSafeArea()
            .frame(width: geometry.size.width, height: 104) // Adaptado para usar a largura disponível
            .foregroundStyle(.mainRec)
          
          HStack {
            Text("Tarefas")
              .font(.largeTitle)
              .bold()
            
            Spacer()
            
            AddTaskButton(action: addTask)
          }
          .padding()
        }
        Text("Selecione uma das opções abaixo.")
        
        ScrollView(showsIndicators: false) {
          ForEach(tasks) { task in
            TaskRow(task: task)
            
              .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                  taskBeingEdited = task
                }, label: {
                  Label("Editar", systemImage: "pencil")
                })
                
                Button(action: {
                  withAnimation {
                    modelContext.delete(task)
                  }
                }, label: {
                  Label("Deletar", systemImage: "minus.circle.fill")
                })
              }))
              .sheet(item: $taskBeingEdited, content: { task in
                NavigationStack {
                  TaskDetailView(task: task)
                }
              })
          }
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity)
        }
        .padding(.bottom)
      }
      .frame(maxWidth: .infinity)
    }
    .sheet(item: $newTask) { task in
      NavigationStack {
        TaskDetailView(task: task, isNew: true)
      }
      .interactiveDismissDisabled()
    }
    .navigationTitle("Tarefas")
  }
  
  private func addTask() {
    withAnimation {
      newTask = TaskModel()
//      newTask = newItem
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(tasks[index])
      }
    }
  }
}


#Preview {
  TaskView()
    .modelContainer(SampleData.shared.modelContainer)
}
