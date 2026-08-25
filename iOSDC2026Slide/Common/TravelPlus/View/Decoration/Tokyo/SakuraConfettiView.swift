//
//  SakuraConfettiView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct SakuraConfettiView: View {
    private let confettiCount = 30
    private let initialConfettiOffsetList: [CGPoint]

    private let sakuraColorDark = Color("tokyo_sakura_dark")
    private let sakuraColorLight = Color("tokyo_sakura_light")
    private let sakuraColorMiddle = Color("tokyo_sakura_middle")
    private let sakuraTreecolor = Color("tokyo_sakura_tree")

    @State private var isConfettiAnimated = false
    @Binding private var city: City?

    init(city: Binding<City?>) {
        self._city = city
        self.initialConfettiOffsetList = (0..<confettiCount).map { _ in
            .init(
                x: CGFloat.random(in: -300...300),
                y: CGFloat.random(in: -400...400)
            )
        }
    }

    var body: some View {
        var confettiOffsetY: CGFloat {
            isConfettiAnimated ? 400 : -100
        }
        var confettiOpacity: CGFloat {
            confettiOffsetY < 300 ? 1.0 : 0.0
        }
        return ZStack {
            ForEach(0..<confettiCount, id: \.self) { confettiIndex in
                let initialConfettiOffset = initialConfettiOffsetList[confettiIndex]
                SakuraFlowerPieceView(color: sakuraColorMiddle)
                    .rotationEffect(.degrees(.random(in: 0..<90)))
                    .offset(
                        x: initialConfettiOffset.x,
                        y: initialConfettiOffset.y + confettiOffsetY
                    )
                    .opacity(confettiOpacity)
            }
            .animation(
                .linear(duration: 10.0).repeatForever(autoreverses: false),
                value: isConfettiAnimated
            )
            .onChange(of: city) {
                if city == .tokyo {
                    isConfettiAnimated = true
                } else {
                    isConfettiAnimated = false
                }
            }
        }
    }
}
