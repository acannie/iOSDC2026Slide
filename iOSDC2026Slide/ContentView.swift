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
                Text("ホーム画面")
                    .font(.largeTitle)

                Button("自己紹介画面へ進む") {
                    path.append(Destination.introduction)
                }
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
                case .useCases:
                    UseCasesScreen(path: $path)
                case .conclusion:
                    ConclusionScreen(path: $path)
                }
            }
            .navigationTitle("ホーム")
        }
    }
}
