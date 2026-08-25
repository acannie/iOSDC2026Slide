//
//  FlowersView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct FlowersView: View {
    private let flowerLeafColor = Color("tokyo_flower_leaf")
    private let flowerMainColor = Color("tokyo_flower_main")
    private let sakuraColorLight = Color("tokyo_sakura_light")

    @State private var isFlowersAnimated = false

    var body: some View {
        ZStack {
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 400, height: 100)
                .foregroundStyle(sakuraColorLight)
                .offset(x: 160, y: 380)
            SakuraFlowerView(color: .white)
                .offset(x: 0, y: 400)
            SakuraFlowerView(color: .white)
                .offset(x: 80, y: 360)
            SakuraFlowerView(color: .white)
                .offset(x: 180, y: 380)
            flower
                .rotationEffect(.degrees(isFlowersAnimated ? -5 : 5), anchor: .bottom)
                .rotationEffect(.degrees(-10))
                .offset(x: 30, y: 350)
            flower
                .rotationEffect(.degrees(isFlowersAnimated ? 5 : -5), anchor: .bottom)
                .rotationEffect(.degrees(-5))
                .offset(x: 80, y: 320)
            flower
                .rotationEffect(.degrees(isFlowersAnimated ? -5 : 5), anchor: .bottom)
                .rotationEffect(.degrees(10))
                .offset(x: 150, y: 330)
        }
        .animation(
            .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
            value: isFlowersAnimated
        )
        .onAppear {
            isFlowersAnimated = true
        }
    }
}

private extension FlowersView {
    var flower: some View {
        ZStack {
            Text("ノ")
                .font(.system(size: 150, weight: .ultraLight))
                .foregroundStyle(flowerLeafColor)
                .rotationEffect(.degrees(-45))
                .offset(x: 10, y: 70)
            Image(systemName: "leaf.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(x: 5, y: 50)
                .foregroundStyle(flowerLeafColor)
            Image(systemName: "leaf.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(x: 70, y: -30)
                .rotationEffect(.degrees(90))
                .foregroundStyle(flowerLeafColor)
            Image(systemName: "fan.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(flowerMainColor)
        }
    }
}
