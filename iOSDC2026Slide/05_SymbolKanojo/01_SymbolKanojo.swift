//
//  SymbolKanojo.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct SymbolKanojo: View {
    @ObservedObject private var yuyuVM = YuyuViewModel()

    var body: some View {
        VStack {
            HStack {
                yuyu
                    .offset(y: -100)
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension SymbolKanojo {
    var yuyu: some View {
        KanojoView(
            kanojoParts: yuyuVM.parts,
            scale: 1.0,
            isUpsideDown: yuyuVM.activeAction == .turnUpsideDown
        )
        .offset(y: 10)
        .opacity(yuyuVM.activeAction == .fade ? 0.5 : 1.0)
        .offset(x: yuyuVM.activeAction == .shake ? 2 : 0)
    }
}
