//
//  LeavesView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct LeavesView: View {
    private let colorLight = Color("bangkok_leaf_light")
    private let colorMiddle = Color("bangkok_leaf_middle")
    private let colorDark = Color("bangkok_leaf_dark")

    @State private var isLeavesAnimated = false

    var body: some View {
        ZStack {
            leaf(fillColor: colorLight, outlineColor: colorMiddle)
                .scaleEffect(2.0)
                .rotationEffect(.degrees(-90 + (isLeavesAnimated ? -5 : 5)), anchor: .bottomTrailing)
                .offset(x: 0, y: 0)
            leaf(fillColor: colorMiddle, outlineColor: colorDark)
                .scaleEffect(1.5)
                .rotationEffect(.degrees(-70 + (isLeavesAnimated ? 10 : -10)), anchor: .bottomTrailing)
                .offset(x: -20, y: -40)
            leaf(fillColor: colorMiddle, outlineColor: colorDark)
                .scaleEffect(1.5)
                .rotationEffect(.degrees(-110 + (isLeavesAnimated ? 10 : -10)), anchor: .bottomTrailing)
                .offset(x: 50, y: 0)
        }
        .offset(x: 120, y: -470)
        .animation(
            .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
            value: isLeavesAnimated
        )
        .onAppear {
            isLeavesAnimated = true
        }
    }
}

private extension LeavesView {
    func leaf(fillColor: Color, outlineColor: Color) -> some View {
        ZStack {
            Image(systemName: "leaf.fill")
                .resizable()
                .foregroundStyle(fillColor)
                .frame(width: 100, height: 100)
            Image(systemName: "leaf")
                .resizable()
                .foregroundStyle(outlineColor)
                .frame(width: 100, height: 100)
        }
    }
}
