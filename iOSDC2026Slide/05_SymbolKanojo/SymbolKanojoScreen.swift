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
        case iWannaMakeContent
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
                goPreviousAction: {
                    if currentPage > 0 {
                        currentPage -= 1
                    } else {
                        path.removeLast()
                    }
                },
                goNextAction: {
                    if currentPage < Page.allCases.count - 1 {
                        currentPage += 1
                    } else {
                        path.append(Destination.conclusion)
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension SymbolKanojoScreen {
    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .iWannaMakeContent:
            IWannaMakeContent()
        case .symbolKanojo:
            SymbolKanojo(isActive: currentPage == page.rawValue)
        }
    }
}
