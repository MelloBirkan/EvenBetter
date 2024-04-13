//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
  @Query private var tasks: [TaskModel]
  @State var isPresented = false
  @State var expandida = false
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        ZStack(alignment: .bottom) {
          RoundedRectangle(cornerRadius: 25)
            .ignoresSafeArea()
            .frame(width: geometry.size.width, height: 90) // Adaptado para usar a largura disponível
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
          }
        }
        .padding(.bottom)
      }
      .frame(maxWidth: .infinity)
    }
    .sheet(isPresented: $isPresented, content: {
      AddTaskView()
    })
  }
}

#Preview {
  let container = try! ModelContainer(for: TaskModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
  
  container.mainContext.insert(TaskModel(title: "Tomar banho"))
  return TaskView()
    .modelContainer(container)
}
