//
//  Task.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 11/04/24.
//

import Foundation
import SwiftData

@Model
final class TaskModel {
  var title: String
  var summary: String?
  var hour: Date
  
  init(title: String = "", summary: String? = nil, hour: Date = Date.now) {
    self.title = title
    self.summary = summary
    self.hour = hour
  }
}
