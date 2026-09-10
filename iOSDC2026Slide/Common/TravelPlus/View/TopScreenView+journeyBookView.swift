//
//  TopScreenView+journeyBookView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

extension TopScreenView {
    var journeyBookView: some View {
        VStack {
            Spacer()
            VStack(spacing: 50) {
                logo
                Button(
                    action: {
                        withAnimation {
                            vm.shouldOpenJourneyBook = false
                        }
                    },
                    label: {
                        Text("DISCOVER BY PAGE")
                            .foregroundStyle(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(.normalSubTheme)
                            .cornerRadius(12)
                    }
                )
            }
            Spacer()
        }
        .frame(width: 400, height: 850)
        .background(.backgroundTop)
    }
}

private extension TopScreenView {
    var logo: some View {
        HStack(spacing: 12) {
            VStack(spacing: -20) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.clear)
                    .stroke(.normalTheme, lineWidth: 8)
                    .frame(width: 32, height: 32)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.normalTheme)
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(.backgroundTop)
                        .fontWeight(.ultraLight)
                        .frame(width: 8, height: 45)
                        .rotationEffect(.degrees(45))
                        .offset(x: -20, y: 20)
                    Image(systemName: "airplane.up.right")
                        .resizable()
                        .foregroundStyle(.backgroundTop)
                        .fontWeight(.ultraLight)
                        .frame(width: 50, height: 50)
                }
            }
            VStack(alignment: .leading, spacing: -8) {
                ForEach(["Travel", "Plus"], id: \.self) { text in
                    Text(text)
                        .foregroundStyle(.normalTheme)
                        .font(.system(size: 40, weight: .bold))
                }
            }
        }
    }
}
