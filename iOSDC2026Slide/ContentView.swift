//
//  ContentView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI
import SwiftData

// 遷移先の識別や渡すデータをまとめた型（Hashableが必須）
enum Destination: Hashable {
    case introduction
    case symbolKanojo
}

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
                case .symbolKanojo:
                    SymbolKanojoScreen(path: $path)
                }
            }
            .navigationTitle("ホーム")
        }
    }
}
