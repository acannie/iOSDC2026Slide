//
//  03_Animating.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Animating: View {
    let isActive: Bool
    @State private var isShowingGraphic: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            title
                .padding(.top, 64)
            Spacer()
            HStack(spacing: 100) {
                CreamSodaView(isShowingGraphic: isShowingGraphic)
                    .padding(.leading, 100)
                MovingEyesView(isShowingGraphic: isShowingGraphic)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    animationStartButton
                    Spacer()
                }
            }
        }
    }

    var title: some View {
        Text("うごかす")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.introductionText)
    }

    var animationStartButton: some View {
        Button(action: {
            isShowingGraphic.toggle()
        }) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 100, height: 100)
        }
    }
}
