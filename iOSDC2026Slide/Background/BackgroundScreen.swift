//
//  BackgroundScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/10.
//

import SwiftUI

struct BackgroundScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("次へ") {
                path.append(Destination.aboutSfSymbols)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: { path.removeLast() },
                goNextAction: { path.append(Destination.aboutSfSymbols) }
            )
        }
        .navigationTitle("問題提起")
        .navigationBarBackButtonHidden(true)
    }
}
