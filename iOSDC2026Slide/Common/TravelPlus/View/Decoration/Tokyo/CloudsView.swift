//
//  CloudsView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct CloudsView: View {
    private let color = Color("tokyo_cloud")

    @State private var isCloudsAnimated = false

    var body: some View {
        ZStack {
            cloud
                .offset(x: -100, y: -270)
                .offset(x: isCloudsAnimated ? -20 : 0)
            cloud
                .offset(x: 100, y: -320)
                .offset(x: isCloudsAnimated ? 20 : 0)
        }
        .animation(
            .easeIn(duration: 2.0).repeatForever(autoreverses: true),
            value: isCloudsAnimated
        )
        .onAppear {
            isCloudsAnimated = true
        }
    }
}

private extension CloudsView {
    var cloud: some View {
        Image(systemName: "cloud.fill")
            .resizable()
            .frame(width: 200, height: 30)
            .foregroundStyle(color)
    }
}
