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
  @State var taskTitle: String = ""
  @State var taskDescription: String = ""
  @State var taskHour: Date = Date.now
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        
        Form {
          Section {
            TextField("Nome da tarefa", text: $taskTitle)
            
          } header: {
            Text("Título")
              .fontWeight(.medium)
          }
          .headerProminence(.increased)
          
          Section {
            TextField("Adicione uma descrição mais detalhada da tarefa", text: $taskDescription)
            
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
              
              Text("\(taskHour.formatted(.dateTime.hour().minute()))")
                .padding(10)
                .background(.thinMaterial)
                .animation(.easeOut, value: taskHour)
            }
            Divider()
            DatePicker("", selection: $taskHour, displayedComponents: .hourAndMinute)
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
            let task = TaskModel(title: taskTitle, summary: taskDescription, hour: taskHour)
            modelContext.insert(task)
            dismiss()
          }
          .disabled(taskTitle.isEmpty)
        }
      }
    }
    .tint(.rightRec)
  }
}

#Preview {
  AddTaskView()
}
