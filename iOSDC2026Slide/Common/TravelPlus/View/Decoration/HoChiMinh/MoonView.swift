//
//  MoonView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct MoonView: View {
    private let color = Color("hoChiMinh_moon")

    @State private var isMoonAnimated: Bool = false

    var body: some View {
        ZStack {
            Image (systemName: "moon.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(color)
                .rotationEffect(.degrees(isMoonAnimated ? -15 : 15))
                .shadow(color: color, radius: 40)
                .animation(
                    .easeInOut(duration: 3.0).repeatForever(autoreverses: true),
                    value: isMoonAnimated
                )
                .offset(x: 110, y: -300)
                .onAppear {
                    isMoonAnimated = true
                }
        }
    }
}
