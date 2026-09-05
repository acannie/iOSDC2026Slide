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
    @State private var isDay: Bool = true

    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
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
    }

    var title: some View {
        Text(isDay ? "字体を活用する" : "光らせる")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(isDay ? .black : .white)
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
