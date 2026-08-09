//
//  IntroductionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct IntroductionScreen: View {
    @Binding var path: NavigationPath
    @State var tappedCount: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            Button("シンボルカノジョ。画面へ進む") {
                path.append(Destination.symbolKanojo)
            }
        }
        .navigationTitle("自己紹介画面")
    }
}
