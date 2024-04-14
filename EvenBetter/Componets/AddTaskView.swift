//
//  AddTodoView.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 10/04/24.
//
import SwiftData
import SwiftUI

struct AddTaskView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext
  @Bindable var task: TaskModel
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        
        Form {
          Section {
            TextField("Nome da tarefa", text: $task.title)
            
          } header: {
            Text("Título")
              .fontWeight(.medium)
          }
          .headerProminence(.increased)
          
          Section {
            TextField("Adicione uma descrição mais detalhada da tarefa", text: $task.summary)
            
          } header: {
            Text("Descrição")
              .fontWeight(.medium)
            
          } footer: {
            Text("Opcional")
            
          }
          .headerProminence(.increased)
          
          VStack {
            HStack {
              Text("Horário")
                .foregroundStyle(.secondary)
              
              Spacer()
              
              Text("\(task.hour.formatted(.dateTime.hour().minute()))")
                .padding(10)
                .background(.thinMaterial)
                .animation(.easeOut, value: task.hour)
            }
            Divider()
            DatePicker("", selection: $task.hour, displayedComponents: .hourAndMinute)
              .datePickerStyle(.wheel)
          }
        }
      }
      .navigationTitle("Nova Tarefa")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button("Cancel") {
            dismiss()
          }
          .foregroundStyle(.red)
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button("Adicionar") {
            let task = TaskModel(title: task.title, summary: task.summary, hour: task.hour)
            modelContext.insert(task)
            dismiss()
          }
          .disabled(task.title.isEmpty)
        }
      }
    }
    .tint(.rightRec)
  }
}

#Preview {
  AddTaskView(task: TaskModel())
}
