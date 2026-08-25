//
//  ConclusionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/10.
//

import SwiftUI

struct ConclusionScreen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case conclusion
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
                goPreviousAction: { path.removeLast() },
                goNextAction: {}
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension ConclusionScreen {
    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .conclusion:
            Conclusion()
        }
    }
}
