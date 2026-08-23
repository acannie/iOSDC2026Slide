//
//  ConclusionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/10.
//

import SwiftUI

struct ConclusionScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Text("終わり")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: { path.removeLast() },
                goNextAction: {}
            )
        }
        .navigationTitle("さいごに")
        .navigationBarBackButtonHidden(true)
    }
}
