//
//  GrassView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct GrassView: View {
    private let color = Color("hoChiMinh_grass")

    @State private var isGrassAnimated: Bool = false

    var body: some View {
        ZStack {
            laurel
                .rotationEffect(.degrees(isGrassAnimated ? 90 : 85), anchor: .bottomLeading)
                .offset(x: -260, y: -270)
            laurel
                .rotationEffect(.degrees(isGrassAnimated ? 80 : 75), anchor: .bottomLeading)
                .offset (x: -230, y: -300)
            laurel
                .rotationEffect(.degrees(isGrassAnimated ? 50 : 60), anchor: .bottomLeading)
                .offset(x: -200, y: -320)
            laurel
                .rotationEffect(.degrees(isGrassAnimated ? 40 : 50), anchor: .bottomLeading)
                .offset(x: -200, y: -370)
            laurel
                .rotationEffect(.degrees(isGrassAnimated ? 70 : 80), anchor: .bottomLeading)
                .offset (x: -170, y: -400)
            laurel
                .rotationEffect(.degrees(isGrassAnimated ? 50 : 60), anchor: .bottomLeading)
                .offset (x: -240, y: -440)
        }
        .animation(
            .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
            value: isGrassAnimated
        )
        .onAppear {
            isGrassAnimated = true
        }
    }
}

private extension GrassView {
    var laurel: some View {
        ZStack {
            Image(systemName: "laurel.trailing")
                .resizable()
                .frame(width: 50, height: 150)
                .foregroundStyle(color)
                .offset(y: -5)
            Image(systemName: "laurel.trailing")
                .resizable()
                .foregroundStyle(color)
                .frame(width: 50, height: 150)
                .offset(y: 5)
        }
    }
}
