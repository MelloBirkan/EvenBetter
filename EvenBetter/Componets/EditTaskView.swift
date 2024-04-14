//
//  EditTaskView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 14/04/24.
//

import SwiftData
import SwiftUI

struct EditTaskView: View {
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
      .navigationTitle(task.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .cancellationAction) {
          Button("Cancel") {
            dismiss()
          }
          .foregroundStyle(.red)
        }
        ToolbarItemGroup(placement: .confirmationAction) {
          Button("Salvar") {
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
  let container = try! ModelContainer(for: TaskModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
  return EditTaskView(task: TaskModel())
    .modelContainer(container)
}

