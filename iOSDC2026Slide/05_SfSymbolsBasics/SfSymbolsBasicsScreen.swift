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
        case interpreting
        case combining
        case animating
        case glowing
        case rotatingIn3D

        @ViewBuilder
        var content: some View {
            switch self {
            case .coloring: Coloring()
            case .interpreting: Interpreting()
            case .combining: Combining()
            case .animating: Animating()
            case .glowing: Glowing()
            case .rotatingIn3D: RotatingIn3D()
            }
        }
    }

    var body: some View {
        ZStack {
            ForEach(Page.allCases, id: \.self) { page in
                page.content
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
}
