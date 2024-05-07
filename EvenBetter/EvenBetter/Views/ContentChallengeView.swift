//
//  ContentChallengeView.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 05/05/24.
//

import SwiftUI

struct ContentChallengeView: View {
  @State private var atualChallenges: ChallengeOO = ChallengeOO()
  @State private var moodSelected: Mood?
  
    var body: some View {
      if atualChallenges.challenge.isEmpty {
        MoodView(moodSelected: $moodSelected, atualChallenge: $atualChallenges)
      } else {
        ChallengeView(atualChallenge: $atualChallenges)
      }
    }
}

#Preview {
    ContentChallengeView()
}
