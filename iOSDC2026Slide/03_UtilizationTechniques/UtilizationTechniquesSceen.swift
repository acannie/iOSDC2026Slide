//
//  UtilizationTechniquesSceen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct UtilizationTechniquesSceen: View {
    @Binding var path: NavigationPath
    @State var currentPage: Int = 0

    enum Page: Int, CaseIterable {
        case coloring
        case reimaginingAndCombining
        case selectingFontsAndGlowing
        case animating
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
        .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    func pageContent(for page: Page) -> some View {
        switch page {
        case .coloring:
            Coloring()
        case .reimaginingAndCombining:
            ReimaginingAndCombining(isActive: currentPage == page.rawValue)
        case .animating:
            Animating(isActive: currentPage == page.rawValue)
        case .selectingFontsAndGlowing:
            SelectingFontsAndGlowing(isActive: currentPage == page.rawValue)
        case .rotatingIn3D:
            RotatingIn3D(isActive: currentPage == page.rawValue)
        }
    }
}
