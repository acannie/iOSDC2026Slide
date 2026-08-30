//
//  IntroductionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct IntroductionScreen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case introduction
    }

    var body: some View {
        ZStack {
            ForEach(Page.allCases, id: \.self) { page in
                pageContent(for: page)
                    .opacity(currentPage == page.rawValue ? 1 : 0)
                    .animation(.easeInOut, value: currentPage)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: {},
                goNextAction: { path.append(Destination.background) }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension IntroductionScreen {
    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .introduction:
            Introduction()
        }
    }
}
