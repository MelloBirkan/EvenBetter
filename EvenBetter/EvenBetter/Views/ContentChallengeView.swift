//
//  ContentChallengeView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 05/05/24.
//

import SwiftUI
import SwiftData

struct ContentChallengeView: View {
  @Query private var atualChallenges: [Challenge]
  @State private var moodSelected: Mood?
  
    var body: some View {
      if atualChallenges.isEmpty {
        MoodView(moodSelected: $moodSelected)
      } else {
        ChallengeView(atualChallenge: atualChallenges[0])
          .task {
            moodSelected = nil
          }
      }
    }
}

#Preview {
    ContentChallengeView()
}
