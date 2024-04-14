//
//  EvenBetterApp.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 09/04/24.
//

import SwiftUI
import SwiftData

@main
struct EvenBetterApp: App {
  @StateObject var audioManager = AudioManager()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for: TaskModel.self)
            .environmentObject(audioManager)
        }
    }
}
