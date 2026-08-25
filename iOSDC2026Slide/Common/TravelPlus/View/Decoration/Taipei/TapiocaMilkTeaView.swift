//
//  TapiocaMilkTeaView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct TapiocaMilkTeaView: View {
    private let milkTeaColor = Color ("taipei_tapiocaMilkTea_milkTea")
    private let bottleColor = Color("taipei_tapiocaMilkTea_bottle")
    private let tapiocaColor = Color("taipei_tapiocaMilkTea_tapioca")
    private let blackSugarColor = Color("taipei_tapiocaMilkTea_blackSugar")

    private let tapiocaPositions: [CGPoint]
    private let tapiocaCount = 20

    init() {
        self.tapiocaPositions = (0..<tapiocaCount).map { _ in
            let x = CGFloat.random(in: -30...30)
            let y = CGFloat.random(in: 60...100)
            return CGPoint(x: x, y: y)
         }
    }

    var body: some View {
        ZStack {
            ZStack {
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .symbolRenderingMode(.palette)
                    .resizable()
                    .foregroundStyle(milkTeaColor, .clear)
                    .offset (x: -60)
                ForEach(tapiocaPositions, id: \.self) { tapiocaPosition in
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .rotationEffect(.degrees(90))
                        .foregroundStyle (tapiocaColor)
                        .symbolEffect(.wiggle)
                        .offset(x: tapiocaPosition.x, y: tapiocaPosition.y)
                }
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [blackSugarColor, blackSugarColor, .clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 90, height: 50)
                Image(systemName: "takeoutbag.and.cup.and.straw")
                    .symbolRenderingMode(.palette)
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(bottleColor, .clear)
                    .opacity(0.8)
                    .offset(x: -60)
            }
            .frame(width: 250, height: 250)
        }
        .rotationEffect(.degrees(-10))
        .offset(x: 140, y: 310)
    }
}
