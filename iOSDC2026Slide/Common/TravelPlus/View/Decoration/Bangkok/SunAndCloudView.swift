//
//  SunAndCloudView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct SunAndCloudView: View {
    private let sunColor = Color("bangkok_sun")
    private let cloudColor = Color("bangkok_cloud")

    @State private var isCloudsAnimated = false

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundStyle(sunColor)
                .shadow(color: sunColor, radius: isCloudsAnimated ? 20 : 40)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isCloudsAnimated
                )
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 150, height: 25)
                .foregroundColor(cloudColor)
                .offset(x: 80, y: -20)
                .offset(x: isCloudsAnimated ? -20 : 0)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isCloudsAnimated
                )
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 180, height: 25)
                .foregroundColor(cloudColor)
                .offset(x: 150, y: 70)
                .offset(x: isCloudsAnimated ? 20 : 0)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isCloudsAnimated
                )
        }
        .offset(x: -130, y: -330)
        .onAppear {
            isCloudsAnimated = true
        }
    }
}
