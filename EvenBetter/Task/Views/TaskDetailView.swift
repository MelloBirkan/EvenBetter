//
//  EditTaskView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 14/04/24.
//

import SwiftData
import SwiftUI

struct TaskDetailView: View {
  @Bindable var task: TaskModel
  @State private var showCancelAlert = false
  @State private var showConfirmation = false
  let isNew: Bool
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext
  @Environment(\.undoManager) var undoManager
  
  init(task: TaskModel, isNew: Bool = false) {
    self.task = task
    self.isNew = isNew
  }
  
  var body: some View {
      VStack(alignment: .leading) {
        Form {
          Section {
            TextField("Nome da tarefa", text: $task.title)
              .onChange(of: task.title) {
                task.title = String(task.title.trimmingPrefix(/^\s*/))
              }
            
          } header: {
            Text("Título")
              .fontWeight(.medium)
          }
          .headerProminence(.increased)
          
          Section {
            TextField("Adicione uma descrição mais detalhada da tarefa", text: $task.summary)
              .onChange(of: task.summary) {
                task.summary = String(task.summary.trimmingPrefix(/^\s*/))
              }
            
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
      .navigationTitle(isNew ? "Nova Tarefa" : task.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .cancellationAction) {
          Button("Cancelar") {
            showCancelAlert = true
          }
          .foregroundStyle(.red)
        }
        ToolbarItemGroup(placement: .confirmationAction) {
          Button("Salvar") {
            modelContext.insert(task)
            dismiss()
          }
          .disabled(task.title.isEmpty)
        }
      }
      .interactiveDismissDisabled()
      .alert(isPresented: $showCancelAlert) {
        Alert(title: Text(isNew ? "Você tem certeza de que deseja cancelar a criação desta tarefa?"
 : "Cancelar alterações?"),
              primaryButton: .destructive(Text("Sim")) {
          if isNew {
            modelContext.delete(task)
          } else {
            while undoManager?.canUndo == true {
              undoManager?.undo()
            }
          }
          dismiss()
        },
              secondaryButton: .cancel(Text("Não")) {
        })
      }
    .tint(.rightRec)
  }
}

#Preview {
  NavigationStack {
    TaskDetailView(task: SampleData.shared.task)
      .navigationBarTitleDisplayMode(.inline)
  }
  .modelContainer(SampleData.shared.modelContainer)
}

