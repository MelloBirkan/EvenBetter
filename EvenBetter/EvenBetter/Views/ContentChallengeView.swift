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
    @State private var isShowingNameSheet = false
    @AppStorage("hasSeenNameSheet") private var hasSeenNameSheet = false
    @AppStorage("name") private var name: String = "Convidado"
    
    var body: some View {
        Group {
            if atualChallenges.isEmpty {
                MoodView(moodSelected: $moodSelected, name: name)
            } else {
                ChallengeView(atualChallenge: atualChallenges[0])
                    .task {
                        moodSelected = nil
                    }
            }
        }
        .onAppear {
            isShowingNameSheet = !hasSeenNameSheet
        }
        .sheet(isPresented: $isShowingNameSheet) {
            RequestingNameSheet(isShowingNameSheet: $isShowingNameSheet, hasSeenNameSheet: $hasSeenNameSheet, name: $name)
        }
    }
}

#Preview {
    ContentChallengeView()
}
