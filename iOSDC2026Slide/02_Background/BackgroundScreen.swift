//
//  BackgroundScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/10.
//

import SwiftUI

struct BackgroundScreen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case question
        case suggestion
        case guidelines
        case finalImage
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
                        path.append(Destination.sfSymbolBasics)
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension BackgroundScreen {
    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .question:
            Question()
        case .suggestion:
            Suggestion()
        case .guidelines:
            Guidelines()
        case .finalImage:
            FinalImage()
        }
    }
}
