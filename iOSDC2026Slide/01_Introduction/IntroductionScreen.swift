//
//  IntroductionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct IntroductionScreen: View {
    @Binding var path: NavigationPath

    private enum Profile: CaseIterable {
        case name
        case company
        case iosExperience
        case education

        var iconName: String {
            switch self {
            case .name: "person.fill"
            case .company: "building.fill"
            case .iosExperience: "laptopcomputer"
            case .education: "graduationcap.fill"
            }
        }

        var title: String {
            switch self {
            case .name: "氏名"
            case .company: "所属"
            case .iosExperience: "職歴"
            case .education: "学歴"
            }
        }

        var body: String {
            switch self {
            case .name: "ささおか あかね"
            case .company: "LINEヤフー株式会社"
            case .iosExperience: "iOSエンジニア歴 約3年"
            case .education: "金沢大学電子情報学類卒"
            }
        }

        var color: Color {
            switch self {
            case .name: .introductionGreen
            case .company: .introductionBlue
            case .iosExperience: .introductionPink
            case .education: .introductionYellow
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 80) {
            title
                .padding(.leading, 64)
                .padding(.top, 64)
            HStack(spacing: 20) {
                image
                    .overlay {
                        decoration
                    }
                VStack(spacing: 20) {
                    ForEach(Profile.allCases, id: \.self) { profile in
                        profileCard(
                            iconName: profile.iconName,
                            title: profile.title,
                            body: profile.body,
                            color: profile.color
                        )
                    }
                }
                .padding(.trailing, 64)
            }
            .padding(.vertical, 64)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.introductionBackground)
        .overlay {
            DestinationButtonOverlayView(
                goPreviousAction: {},
                goNextAction: { path.append(Destination.background) }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

private extension IntroductionScreen {
    var title: some View {
        Text("自己紹介")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.introductionText)
    }

    var image: some View {
        Image("acannie")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func profileCard(
        iconName: String,
        title: String,
        body: String,
        color: Color
    ) -> some View {
        HStack(spacing: 28) {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 72, height: 72)
                .foregroundStyle(color)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundStyle(.introductionText)
                    .padding(.leading, 2)
                Text(body)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(.introductionText)
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 20)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(color)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
                RoundedRectangle(cornerRadius: 14)
                    .fill(.introductionBackground)
                    .padding(4)
            }
        }
    }

    var decoration: some View {
        VStack {
            HStack {
                // 左上
                ZStack {
                    Image(systemName: "sparkle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.introductionPink)
                        .frame(width: 30)
                        .offset(x: 70)
                    Circle()
                        .foregroundStyle(.introductionYellow)
                        .frame(width: 10)
                        .offset(y: 60)
                }
                Spacer()
                // 右上
                ZStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.introductionGreen)
                        .frame(width: 50)
                        .rotationEffect(.degrees(-15))
                        .offset(x: -80, y: 40)
                    Image(systemName: "sparkle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.introductionBlue)
                        .frame(width: 20)
                        .offset(x: -20, y: 80)
                }
            }
            Spacer()
            HStack {
                // 左下
                ZStack {
                    Circle()
                        .foregroundStyle(.introductionBlue)
                        .frame(width: 10)
                        .offset(y: -130)
                    Image(systemName: "sparkle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.introductionYellow)
                        .frame(width: 20)
                        .offset(x: 30, y: -60)
                    Circle()
                        .foregroundStyle(.introductionPink)
                        .frame(width: 20)
                        .offset(x: 100)
                }
                Spacer()
                // 右下
                ZStack {
                    Circle()
                        .foregroundStyle(.introductionBlue)
                        .frame(width: 15)
                        .offset(y: -20)
                }
            }
        }
        .padding(32)
    }
}
