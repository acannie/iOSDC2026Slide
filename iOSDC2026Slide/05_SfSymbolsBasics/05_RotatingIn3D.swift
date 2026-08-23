//
//  05_RotatingIn3D.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct RotatingIn3D: View {
    let isActive: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                title
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

    var title: some View {
        HStack {
            Text("まわす")
                .font(.system(size: 100))
            Spacer()
        }
        .padding(.horizontal, 48)
    }
}
