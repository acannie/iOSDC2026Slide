//
//  IntroductionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct IntroductionScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("次へ") {
                path.append(Destination.background) 
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: {},
                goNextAction: { path.append(Destination.background) }
            )
        }
        .navigationTitle("自己紹介")
        .navigationBarBackButtonHidden(true)
    }
}
