//
//  03_Animating.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Animating: View {
    let isActive: Bool

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
                CreamSodaView()
                    .padding(.leading, 100)
                MovingEyesView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}
