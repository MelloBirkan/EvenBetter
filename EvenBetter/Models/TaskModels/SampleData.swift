//
//  SampleData.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 14/04/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
  static let shared = SampleData() //singlethon
  
  let modelContainer: ModelContainer
  
  var context: ModelContext {
    modelContainer.mainContext
  }
  
  private init() {
    let schema = Schema([
        TaskModel.self,
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

    do {
        modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
      
      insertSampleData()
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
  }
  
  func insertSampleData() {
    for task in TaskModel.sampleData {
      context.insert(task)
    }
    do {
      try context.save()
    } catch {
      print("Sample data contect failed to save:\(error)")
    }
  }
  
  var task: TaskModel {
    TaskModel.sampleData[0]
  }
}

