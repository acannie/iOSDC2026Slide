//
//  04_FinalImage.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/29.
//

import SwiftUI

struct FinalImage: View {
    @State private var isShowingOnlyImage: Bool = false

    var body: some View {
        ZStack {
            Introduction(slideType: .finalImageScreen)
            .overlay {
                Color.black.opacity(isShowingOnlyImage ? 0.7 : 0)
                    .ignoresSafeArea(.all)
            }
            Introduction(slideType: .onlyImage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut, value: isShowingOnlyImage)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    showingOnlyImageButton
                    Spacer()
                }
            }
        }
    }
}

private extension FinalImage {
    var showingOnlyImageButton: some View {
        Button(action: {
            isShowingOnlyImage.toggle()
        }) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 100, height: 100)
        }
    }
}
