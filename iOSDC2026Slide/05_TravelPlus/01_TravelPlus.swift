//
//  01_TravelPlus.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct TravelPlus: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 64) {
                title
                VStack(alignment: .leading) {
                    ForEach(StrongPoint.allCases, id: \.self) { strongPoint in
                        item(strongPoint)
                    }
                }
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            Spacer()
            smartphone
            Spacer()
        }
    }
}

private enum StrongPoint: CaseIterable {
    case developedAtHackathon
    case developmentTime
    case lightweightAnimation

    var text: String {
        switch self {
        case .developedAtHackathon: "ハッカソンで実用"
        case .developmentTime: "製作時間2日半"
        case .lightweightAnimation: "軽量アニメーション"
        }
    }

    var iconName: String {
        switch self {
        case .developedAtHackathon: "laptopcomputer"
        case .developmentTime: "calendar.badge.clock"
        case .lightweightAnimation: "play.rectangle"
        }
    }
}

private extension TravelPlus {
    var title: some View {
        Text("装飾を作ろう")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.introductionText)
    }

    var smartphone: some View {
        ZStack {
            TopScreenView(vm: .init())
                .frame(width: 400, height: 850)
                .clipShape(RoundedRectangle(cornerRadius: 64))
            RoundedRectangle(cornerRadius: 64)
                .fill(.clear)
                .stroke(.black, lineWidth: 20)
                .frame(width: 400, height: 850)
        }
    }

    func item(_ strongPoint: StrongPoint) -> some View {
        HStack(spacing: 32) {
            Image(systemName: strongPoint.iconName)
                .resizable()
                .fontWeight(.semibold)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.orange)
                .frame(width: 80, height: 80)
            Text(strongPoint.text)
                .font(.system(size: 50, weight: .semibold))
        }
    }
}
