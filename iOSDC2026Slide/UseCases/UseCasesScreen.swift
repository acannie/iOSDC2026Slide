//
//  UseCasesScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct UseCasesScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("次へ") {
                path.append(Destination.conclusion)
            }
        }
        .navigationTitle("活用例")
        .navigationBarBackButtonHidden(true)
    }
}
