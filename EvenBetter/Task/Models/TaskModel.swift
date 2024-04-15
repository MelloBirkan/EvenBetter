//
//  Task.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 11/04/24.
//

import SwiftUI
import SwiftData

@Model
final class TaskModel {
  var title: String
  var summary: String
  var hour: Date
  var isCompleted: Bool = false
  var color: String
    
  static let colors = ["LeftRecColor", "RightRecColor", "MidRecColor", "MainRecColor"]
  
  init(title: String = "", summary: String = "", hour: Date = Date.now) {
    self.title = title
    self.summary = summary
    self.hour = hour
    self.color = TaskModel.colors.randomElement()!
  }
  
  static let sampleData = [
    TaskModel(title: "Tomar banho", summary: "Pegar toalha na varanda", hour: Date()),
        TaskModel(title: "Estudar Swift", summary: "Revisar conceitos de Date e DateFormatter", hour: Date()),
        TaskModel(title: "Fazer compras", summary: "Comprar leite, pão e ovos", hour: Date()),
        TaskModel(title: "Ir à academia", summary: "", hour: Date()),
        TaskModel(title: "Ler um livro", summary: "Capítulo 5 do livro de programação", hour: Date())
  ]
}
