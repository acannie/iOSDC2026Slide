//
//  ContentView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // 画面の履歴（パス）を管理する状態変数
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                IntroductionScreen(path: $path)
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .introduction:
                    IntroductionScreen(path: $path)
                case .background:
                    BackgroundScreen(path: $path)
                case .guidelines:
                    GuidelinesScreen(path: $path)
                case .sfSymbolBasics:
                    SfSymbolsBasicsScreen(path: $path)
                case .travelPlus:
                    TravelPlusScreen(path: $path)
                case .symbolKanojo:
                    SymbolKanojoScreen(path: $path)
                case .summary:
                    SummaryScreen(path: $path)
                case .conclusion:
                    ConclusionScreen(path: $path)
                }
            }
        }
    }
}
