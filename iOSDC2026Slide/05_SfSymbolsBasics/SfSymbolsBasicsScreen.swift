//
//  SfSymbolsBasicsScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct SfSymbolsBasicsScreen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case coloring
        case interpretingAndCombining
        case animating
        case glowing
        case rotatingIn3D
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
                        path.append(Destination.travelPlus)
                    }
                }
            )
        }
        .navigationTitle("SF Symbols 活用の基本")
        .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .coloring:
            Coloring()
        case .interpretingAndCombining:
            InterpretingAndCombining(isActive: currentPage == page.rawValue)
        case .animating:
            Animating(isActive: currentPage == page.rawValue)
        case .glowing:
            Glowing()
        case .rotatingIn3D:
            RotatingIn3D()
        }
    }
}
