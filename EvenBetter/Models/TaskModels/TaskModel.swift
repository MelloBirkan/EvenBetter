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
  var taskTitle: String
  var taskSummary: String?
  var taskHour: Date
  var taskIsCompleted: Bool = false
  var taskColor: Color {
    // gera uma cor aleatória dentre as disponíveis
    let colors = [Color.blue, Color.green, Color.red, Color.yellow]
    return colors[Int.random(in: 0..<4)]
  }
  
  init(title: String = "", summary: String? = nil, hour: Date = Date.now) {
    self.taskTitle = title
    self.taskSummary = summary
    self.taskHour = hour
  }
}
