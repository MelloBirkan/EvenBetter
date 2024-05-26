//
//  ContentView.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Query<TaskModel>(filter:#Predicate { !($0.isCompleted)}) private var tasks: [TaskModel]
  
  var body: some View {
    TabView {
      ContentChallengeView()
        .tabItem {
          Label("Início", systemImage: "house.fill")
      }
      
      TaskView()
        .tabItem {
          Label("Tarefas", systemImage: "square.and.pencil")
        }
        .badge(tasks.count)
      
      MeditationList()
        .tabItem {
          Label("Meditação", systemImage: "moon.stars.fill")
        }
        
    }
    .tint(.tabBar)
  }
}

#Preview {
  ContentView()
}
