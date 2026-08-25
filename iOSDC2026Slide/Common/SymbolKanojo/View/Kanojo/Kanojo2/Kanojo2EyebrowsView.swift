//
//  Kanojo2EyebrowsView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct Kanojo2EyebrowsView: EyebrowsView {
    private let eyebrowColor = Color("kanojo2_eyebrow")

    var body: some View {
        ZStack {
            eyebrow(side: .left)
            eyebrow(side: .right)
        }
    }
}

private extension Kanojo2EyebrowsView {
    func eyebrow(side: Side) -> some View {
        Image(
            systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
            .resizable()
            .foregroundStyle(eyebrowColor)
            .rotationEffect(.degrees(side == .left ? 90 : 270))
            .frame(width: 5, height: 70)
            .offset(x: side.unit * -70, y: -115)
    }
}

#Preview {
    Kanojo2EyebrowsView()
}
