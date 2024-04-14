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
}
