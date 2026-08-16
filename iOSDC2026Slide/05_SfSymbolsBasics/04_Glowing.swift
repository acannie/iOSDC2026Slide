//
//  04_Glowing.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Glowing: View {
    let isActive: Bool
    @State private var count: Int = 0

    var body: some View {
        VStack {
            title
            HStack(spacing: 100) {
                NeonSignView(count: count)
                MarqueeSignView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.black)
        .task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                count += 1
            }
        }
    }

    var title: some View {
        HStack {
            Text("光らせる")
                .font(.system(size: 100))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 48)
    }
}
