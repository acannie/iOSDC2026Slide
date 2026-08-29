//
//  SymbolKanojo.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct SymbolKanojo: View {
    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            Spacer()
            Text("準備中")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.gray)
            smartphone
            Text("準備中")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.gray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension SymbolKanojo {
    var title: some View {
        Text("コンテンツを作ろう")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.introductionText)
    }

    var smartphone: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 64)
                .fill(.pink.opacity(0.2))
                .frame(width: 800, height: 600)
            TalkScreenView()
                .scaleEffect(0.55)
                .frame(width: 800, height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 64))
            RoundedRectangle(cornerRadius: 64)
                .fill(.clear)
                .stroke(.black, lineWidth: 20)
                .frame(width: 800, height: 600)
        }
    }
}
