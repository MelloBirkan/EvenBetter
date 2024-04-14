//
//  ContentView.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 31/03/24.
//

import SwiftUI

struct SerenityView: View {
    var body: some View {
        MeditationList(OO: MeditationOO(meditation: MeditationDO.data))
    }
}

#Preview {
    SerenityView()
    .environmentObject(AudioManager())
}
