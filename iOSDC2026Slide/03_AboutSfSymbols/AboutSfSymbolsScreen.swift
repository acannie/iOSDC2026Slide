//
//  AboutSfSymbolsScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct AboutSfSymbolsScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("次へ") {
                path.append(Destination.guidelines)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: { path.removeLast() },
                goNextAction: { path.append(Destination.guidelines) }
            )
        }
        .navigationTitle("SF Symbols について")
        .navigationBarBackButtonHidden(true)
    }
}
