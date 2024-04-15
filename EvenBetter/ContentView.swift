//
//  ContentView.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Query private var tasks: [TaskModel]
  
  var body: some View {
    TabView {
      VStack {
        HeaderView()
          .frame(height: 425)
        Spacer()
      }
        .tabItem {
          Label("Início", systemImage: "house.fill")
      
      }
      
      TaskView()
        .tabItem {
          Label("Início", systemImage: "square.and.pencil")
        }
        .badge(tasks.count)
      
      MeditationList()
        .tabItem {
          Label("Início", systemImage: "moon.stars.fill")
        }
      
    }
    .tint(.tabBar)
  }
}

#Preview {
  ContentView()
}
