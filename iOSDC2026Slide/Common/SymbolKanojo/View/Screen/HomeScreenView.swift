//
//  HomeScreenView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/05.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject private var vm = HomeScreenViewModel()
    @ObservedObject private var fumiVM = FumiViewModel()

    @State private var isSpeechBubbleAnimated = false

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    private let fumiScale = UIScreen.main.bounds.width / 1500
    private let fumiOriginalWidth: CGFloat = 400
    private let buttonHeight: CGFloat = 120
    private let emoticonGridColumnCount = 5
    private var fumiWidth: CGFloat {
        fumiOriginalWidth * fumiScale
    }
    private let horizontalPadding: CGFloat = 60

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    buttons
                    Spacer()
                    speechBubble
                        .offset(x: (UIScreen.main.bounds.width - horizontalPadding * 2) / 4)
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                fumi
            }
            .background(ScreenBackground.sky.view)
            .navigationBarHidden(true)
        }
    }
}

private extension HomeScreenView {
    var buttons: some View {
        HStack(spacing: 12) {
//            navigationButtonLayout(systemImageName: "book.fill", text: "ストーリー")
            NavigationLink(destination: TalkScreenView()) {
                navigationButtonLayout(systemImageName: "bubble.fill", text: "おはなし")
            }
            .buttonStyle(.plain)
            NavigationLink(destination: EmotionScreenView()) {
                navigationButtonLayout(systemImageName: "face.smiling.inverse", text: "エモーション")
            }
            .buttonStyle(.plain)
        }
        .padding(20)
    }

    func navigationButtonLayout(systemImageName: String, text: String) -> some View {
        VStack {
            Image(systemName: systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(.secondary)
                .frame(height: 32)
                .padding(8)
            Text(text)
                .font(.system(size: 24, weight: .light))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: 250)
        .frame(height: buttonHeight)
        .background(.regularMaterial)
        .cornerRadius(20)
    }

    var fumi: some View {
        KanojoView(kanojoParts: fumiVM.parts, scale: fumiScale, isUpsideDown: fumiVM.activeAction == .turnUpsideDown)
            .offset(x: -fumiWidth / 2, y: buttonHeight)
            .opacity(fumiVM.activeAction == .fade ? 0.5 : 1.0)
            .offset(x: fumiVM.activeAction == .shake ? 2 : 0)
            .onTapGesture {
                let emoticonType = Emoticon.allCases.randomElement() ?? .😀
                fumiVM.express(emoticonType)
                vm.updateDialogue(Character.fumi.dialogue(of: emoticonType))
            }
            .task {
                fumiVM.express(
                    Emoticon
                        .🙄
                        .expression
                        .applyDelta(mouthType: .smile(.medium, nil))
                )
                vm.updateDialogue("今日は何して遊ぶ？")
            }
    }

    var speechBubble: some View {
        ZStack {
            // 吹き出しの下の丸3つ
            VStack {
                Spacer()
                HStack(spacing: 15) {
                    Circle()
                        .foregroundStyle(.thinMaterial)
                        .frame(width: 15)
//                        .offset(y: -5 + (isSpeechBubbleAnimated ? -5 : 5))
                        .offset(y: -5)
                    Circle()
                        .foregroundStyle(.thinMaterial)
                        .frame(width: 20)
//                        .offset(y: -10 + (isSpeechBubbleAnimated ? 5 : -5))
                        .offset(y: -10)
                    Circle()
                        .foregroundStyle(.thinMaterial)
                        .frame(width: 25)
//                        .offset(y: -25 + (isSpeechBubbleAnimated ? -5 : 5))
                        .offset(y: -25)
                    Spacer()
                }
                .frame(height: 50)
                .padding(.leading, 20)
//                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isSpeechBubbleAnimated)
                .onAppear {
                    isSpeechBubbleAnimated = true
                }
            }
            // 吹き出し本体
            ScrollView {
                Text(vm.dialogue)
                    .font(.system(size: 20))
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 28)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 32)
                    .transition(.opacity)
                    .id(vm.dialogue)
            }
            .frame(maxHeight: .infinity)
            .background(.thinMaterial)
            .cornerRadius(64)
            .onTapGesture {
                let emoticonType = Emoticon.allCases.randomElement() ?? .😀
                fumiVM.express(emoticonType)
                vm.updateDialogue(Character.fumi.dialogue(of: emoticonType))
            }
            .padding(.bottom, 50)
        }
        .ignoresSafeArea()
        .frame(width: (UIScreen.main.bounds.width - fumiWidth) / 2.0)
        .frame(maxHeight: 400)
    }
}
