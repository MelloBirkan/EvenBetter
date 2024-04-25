//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
  @Environment(\.modelContext) private var modelContext
  @State private var newTask: TaskModel?
  @State private var taskStatus = TaskStatus.uncompleted
  @State var taskBeingEdited: TaskModel?
  @Query<TaskModel>(filter:#Predicate { $0.isCompleted}) private var completedTasks: [TaskModel]
  @Query<TaskModel>(filter:#Predicate { !($0.isCompleted)}) private var uncompletedTasks: [TaskModel]
  
  var body: some View {
    // MARK: Header
    GeometryReader { geometry in
      VStack {
        ZStack(alignment: .top) {
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
        
        Picker("", selection: $taskStatus) {
          Text("Não completadas").tag(TaskStatus.uncompleted)
          Text("Completadas").tag(TaskStatus.completed)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        
        // MARK: Tasks
        ScrollView(showsIndicators: false) {
          ForEach(taskStatus == .uncompleted ? uncompletedTasks : completedTasks) { task in
            TaskRow(task: task)
            
              .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                  taskBeingEdited = task
                }, label: {
                  Label("Editar", systemImage: "pencil")
                })
                
                Button(action: {
                    modelContext.delete(task)
                }, label: {
                  Label("Deletar", systemImage: "minus.circle.fill")
                })
              }))
              .sheet(item: $taskBeingEdited, content: { task in
                NavigationStack {
                  TaskDetailView(task: task)
                }
              })
              .animation(.bouncy(duration: 0.8), value: [uncompletedTasks, completedTasks])
          }
          .padding(.vertical)
          .frame(maxWidth: .infinity)
        }
        .padding(.bottom)
      }
      .frame(maxWidth: .infinity)
    }
    .background(Color.BG)
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
    }
  }
}


#Preview {
  TaskView()
    .modelContainer(SampleData.shared.modelContainer)
}
