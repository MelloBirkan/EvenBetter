//
//  SampleDataChallenge.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 16/05/24.
//

import Foundation
import SwiftData

@MainActor
class SampleDataChallenge {
  static let shared = SampleDataChallenge() //singlethon
  
  let modelContainer: ModelContainer
  
  var context: ModelContext {
    modelContainer.mainContext
  }
  
  private init() {
    let schema = Schema([
        Challenge.self,
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
    
      context.insert(Challenge(mood: .feliz, name: "Dança", summary: "Dance sua música favorita por alguns minutos", image: "https://cdn.midjourney.com/5325e4ec-dde1-4564-a025-687a7a090d40/0_0.png"))

    do {
      try context.save()
    } catch {
      print("Sample data contect failed to save:\(error)")
    }
  }
  
  var challenge: Challenge {
    Challenge.sampleData
  }
}
