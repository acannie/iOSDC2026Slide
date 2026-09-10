//
//  01_IWannaMakeContent.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/10.
//

import SwiftUI

struct IWannaMakeContent: View {
    @State private var isActive: Bool = false

    var body: some View {
        VStack(spacing: 64) {
            Text("装飾じゃ足りない")
                .font(.system(size: 60, weight: .bold))
                .foregroundStyle(.white)
            (
                Text("コンテンツ")
                    .foregroundStyle(.red)
                + Text("をつくりたい")
                    .foregroundStyle(.white)
            )
            .font(.system(size: 100, weight: .bold))
            .opacity(isActive ? 1 : 0)
            .shadow(color: .white.opacity(0.4), radius: 4)
            .animation(.easeInOut.delay(1.0), value: isActive)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear {
            isActive = true
        }
    }
}
