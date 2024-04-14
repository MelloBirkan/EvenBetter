//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var tasks: [TaskModel]
  @State var isPresented = false
  @State var isEditing = false
  @State var expandida = false
  @State var taskBeingEdited: TaskModel? // Modificado para armazenar a tarefa atual
  
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
            
            AddTaskButton(isVisible: $isPresented)
          }
          .padding()
        }
        Text("Selecione uma das opções abaixo.")
        
        ScrollView(showsIndicators: false) {
          ForEach(tasks) { task in
            TaskRow(task: task)
              .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                  taskBeingEdited = task // Atualiza a tarefa atual
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
                EditTaskView(task: task)
              })
          }
        }
        .padding(.bottom)
      }
      .frame(maxWidth: .infinity)
    }
    .sheet(isPresented: $isPresented, content: {
      AddTaskView(task: TaskModel())
    })
  }
}


#Preview {
  let container = try! ModelContainer(for: TaskModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
  
  container.mainContext.insert(TaskModel(title: "Tomar banho", summary: "", hour: Date.now))
  return TaskView()
    .modelContainer(container)
}
