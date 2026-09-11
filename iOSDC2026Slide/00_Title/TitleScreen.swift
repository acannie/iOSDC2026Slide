//
//  TitleScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/12.
//

import SwiftUI

struct TitleScreen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case title
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
                goNextAction: { path.append(Destination.introduction) }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension TitleScreen {
    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .title:
            Title()
        }
    }
}
