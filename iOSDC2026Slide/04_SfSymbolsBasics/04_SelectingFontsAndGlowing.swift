//
//  04_FontsAndGlowing.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI
import Combine

struct FontsAndGlowing: View {
    let isActive: Bool
    @State private var count: Int = 0
    @State private var isDay: Bool = true

    var body: some View {
        VStack {
            title
            HStack(spacing: 100) {
                NeonSignView(isDay: isDay)
                MarqueeSignView(isDay: isDay)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(isDay ? .white : .black)
        .animation(.easeInOut, value: isDay)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    toggleDayAndNightButton
                    Spacer()
                }
            }
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                count += 1
            }
        }
    }

    var title: some View {
        HStack {
            Text(isDay ? "字体を活用する" : "光らせる")
                .font(.system(size: 100))
                .foregroundStyle(isDay ? .black : .white)
            Spacer()
        }
        .padding(.horizontal, 48)
    }

    var toggleDayAndNightButton: some View {
        Button(action: {
            isDay.toggle()
        }) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 100, height: 100)
        }
    }
}
