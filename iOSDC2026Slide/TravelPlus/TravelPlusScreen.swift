//
//  TravelPlusScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct TravelPlusScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("次へ") {
                path.append(Destination.symbolKanojo)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: { path.removeLast() },
                goNextAction: { path.append(Destination.symbolKanojo) }
            )
        }
        .navigationTitle("TravelPlus")
        .navigationBarBackButtonHidden(true)
    }
}
