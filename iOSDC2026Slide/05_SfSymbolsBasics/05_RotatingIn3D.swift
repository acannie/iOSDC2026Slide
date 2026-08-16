//
//  05_RotatingIn3D.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct RotatingIn3D: View {
    var body: some View {
        VStack {
            title
            HStack {
                CubeView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    var title: some View {
        HStack {
            Text("回す")
                .font(.system(size: 100))
            Spacer()
        }
        .padding(.horizontal, 48)
    }
}
