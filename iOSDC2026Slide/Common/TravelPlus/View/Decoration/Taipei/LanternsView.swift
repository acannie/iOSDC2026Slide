//
//  LanternsView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct LanternsView: View {
    private let lanternMainColorLight = Color("taipei_lantern_main_light")
    private let lanternMainColorDark = Color("taipei_lantern_main_dark")
    private let lanternGold = Color("taipei_lantern_gold")
    private let lanternChainColor = Color("taipei_lantern_chain")

    @State private var isLanternAnimated = false

    var body: some View {
        ZStack {
            lantern
                .offset(x: -180, y: -330)
                .rotationEffect(.degrees(isLanternAnimated ? -1 : 1), anchor: .bottom)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isLanternAnimated
                )
            lantern
                .offset(x: -80, y: -360)
                .rotationEffect(.degrees(isLanternAnimated ? 1 : -1), anchor: .bottom)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isLanternAnimated
                )
            lantern
                .offset(x: 0, y: -300)
                .rotationEffect(.degrees(isLanternAnimated ? -1 : 1), anchor: .bottom)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isLanternAnimated
                )
            lantern
                .offset(x: 80, y: -360)
                .rotationEffect(.degrees(isLanternAnimated ? 1 : -1), anchor: .bottom)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isLanternAnimated
                )
            lantern
                .offset(x: 180, y: -330)
                .rotationEffect(.degrees(isLanternAnimated ? -1 : 1), anchor: .bottom)
                .animation(
                    .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                    value: isLanternAnimated
                )
        }
        .onAppear {
            isLanternAnimated = true
        }
    }
}

private extension LanternsView {
    var lantern: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(lanternGold)
                .frame(width: 2, height: 150)
                .offset(y: -115)
            Image(systemName: "ellipsis")
                .resizable()
                .foregroundStyle(lanternChainColor)
                .rotationEffect(.degrees(90))
                .frame(width: 20, height: 10)
                .offset(y: 60)
            Image(systemName: "crown.fill")
                .resizable()
                .foregroundStyle(lanternGold)
                .rotationEffect(.degrees(180))
                .frame(width: 40, height: 20)
                .offset(y: 40)
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(lanternMainColorDark)
                .frame(width: 80, height: 70)
            Image(systemName: "circle.lefthalf.filled.righthalf.striped.horizontal")
                .resizable()
                .foregroundStyle(lanternMainColorLight)
                .frame(width: 100, height: 70)
                .shadow(color: lanternMainColorLight, radius: 4)
            Rectangle()
                .shadow(color: lanternMainColorLight.opacity(0.2), radius: 4)
                .foregroundStyle(lanternGold)
                .frame(width: 40, height: 10)
                .offset(y: -38)
            Image(systemName: "internaldrive.fill")
                .resizable()
                .foregroundStyle(lanternGold)
                .frame(width: 20, height: 30)
                .offset(y: 90)
        }
    }
}
