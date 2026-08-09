//
//  GuidelinesScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/10.
//

import SwiftUI

struct GuidelinesScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("次へ") {
                path.append(Destination.sfSymbolBasics)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: { path.removeLast() },
                goNextAction: { path.append(Destination.sfSymbolBasics) }
            )
        }
        .navigationTitle("利用規約")
        .navigationBarBackButtonHidden(true)
    }
}
