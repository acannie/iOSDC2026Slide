//
//  IntroductionScreen.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/07/25.
//

import SwiftUI

struct IntroductionScreen: View {
    @Binding var path: NavigationPath

    var body: some View {
        HStack {
            VStack {
                image
                name
            }
            VStack {
                company
                education
                currentWork
                iosExperience
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(
                        action: {
                            path.append(Destination.background)
                        },
                        label: {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: 100, height: 100)
                        }
                    )
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("自己紹介")
        .navigationBarBackButtonHidden(true)
    }
}

private extension IntroductionScreen {
    var image: some View {
        Image("acannie")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 500)
    }

    var name: some View {
        VStack {
            Text("ささおか あかね")
                .font(.largeTitle)
            Text("@sasaoka_akane")
                .font(.headline)
        }
    }

    var company: some View {
        Text("LINEヤフー株式会社")
            .font(.largeTitle)
    }

    var education: some View {
        Text("金沢大学理工学域卒")
            .font(.largeTitle)
    }

    var currentWork: some View {
        Text("LINEで注文 POS/ハンディ アプリ")
            .font(.largeTitle)
    }

    var iosExperience: some View {
        Text("iOSエンジニア歴 約3年")
            .font(.largeTitle)
    }
}
