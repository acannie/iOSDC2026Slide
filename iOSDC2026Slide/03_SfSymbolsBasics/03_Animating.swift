//
//  03_Animating.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Animating: View {
    let isActive: Bool
    @State private var isAnimationStarted: Bool = false
    @State private var isAnimated: Bool = false

    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            HStack(spacing: 100) {
                CreamSodaView(isAnimationStarted: isAnimationStarted)
                    .padding(.leading, 100)
                MovingEyesView(isAnimationStarted: isAnimationStarted)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
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
        .onChange(of: isActive) {
            isAnimated = isActive
        }
    }

    var title: some View {
        Text("うごかす")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.introductionText)
    }

    var animationStartButton: some View {
        Button(action: {
            isAnimationStarted.toggle()
        }) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 100, height: 100)
        }
    }
}
