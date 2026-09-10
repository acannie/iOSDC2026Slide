//
//  05_Rotating.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Rotating: View {
    let isActive: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                title
                    .padding(.top, 64)
                Spacer()
                CubeView()
                Spacer()
            }
            Spacer()
            FanView(isActive: isActive)
        }
        .padding(.horizontal, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension Rotating {
    var title: some View {
        Text("まわす")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.introductionText)
    }
}
