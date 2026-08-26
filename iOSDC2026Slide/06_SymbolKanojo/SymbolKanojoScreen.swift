//
//  SymbolKanojoScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct SymbolKanojoScreen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case symbolKanojo
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
                goNextAction: { path.append(Destination.summary) }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension SymbolKanojoScreen {
    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .symbolKanojo:
            SymbolKanojo()
        }
    }
}
