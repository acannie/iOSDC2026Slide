//
//  SymbolKanojoScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct SymbolKanojoScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("自己紹介画面へ戻る") {
                if !path.isEmpty {
                    path.removeLast()
                }
            }
        }
        .navigationTitle("シンボルカノジョ。画面")
    }
}
