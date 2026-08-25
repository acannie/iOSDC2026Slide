//
//  EmotionScreenView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/05.
//

import SwiftUI

struct EmotionScreenView: View {
    @ObservedObject private var vm = EmotionScreenViewModel()
    @ObservedObject private var fumiVM = FumiViewModel()
    @Environment(\.dismiss) private var dismiss

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    private let fumiScale = UIScreen.main.bounds.width / 1500
    private let fumiOriginalWidth: CGFloat = 300
    private let emoticonGridColumnCount = 5

    private let horizontalPadding: CGFloat = 60

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    dismissButton
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.top, 32)
            fumi
                .offset(x: -fumiOriginalWidth * fumiScale)
            emoticonList
                .offset(x: fumiOriginalWidth * fumiScale)
        }
        .background(ScreenBackground.geometry.view)
        .offset(y: isPad ? 0 : 10)
        .navigationBarHidden(true)
    }
}

private extension EmotionScreenView {
    var dismissButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "arrow.left")
                .resizable()
                .foregroundStyle(.secondary)
                .frame(width: 24, height: 24)
                .background(
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.thinMaterial)
                )
        })
        .buttonStyle(.plain)
    }

    @ViewBuilder
    var fumi: some View {
        KanojoView(kanojoParts: fumiVM.parts, scale: fumiScale, isUpsideDown: fumiVM.activeAction == .turnUpsideDown)
            .opacity(fumiVM.activeAction == .fade ? 0.5 : 1.0)
            .offset(x: fumiVM.activeAction == .shake ? 2 : 0)
    }

    var emoticonList: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<((Emoticon.allCases.count + emoticonGridColumnCount - 1) / emoticonGridColumnCount), id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<emoticonGridColumnCount, id: \.self) { column in
                            let index = row * emoticonGridColumnCount + column
                            if Emoticon.allCases.indices.contains(index) {
                                let emoticon = Emoticon.allCases[index]
                                Text(emoticon.rawValue)
                                    .font(.system(size: 36))
                                    .padding(8)
                                    .opacity(vm.selectedEmotion == emoticon ? 0.5 : 1.0)
                                    .onTapGesture {
                                        // ちらつき防止のためButtonではなくonTapGesture
                                        vm.selectEmotion(emoticon)
                                        fumiVM.express(emoticon)
                                    }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.regularMaterial)
            .cornerRadius(12)
            .padding(.vertical, 12)
        }
    }
}
