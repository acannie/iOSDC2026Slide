//
//  TalkScreenView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

import SwiftUI

struct TalkScreenView: View {
    @ObservedObject private var vm = TalkScreenViewModel()
    @ObservedObject private var fumiVM = FumiViewModel()
    @Environment(\.dismiss) private var dismiss

    @State private var isSpeechBubbleAnimated = false

    private let fumiScale = UIScreen.main.bounds.width / 1500
    private let fumiOriginalWidth: CGFloat = 400
    private let buttonHeight: CGFloat = 120
    private let emoticonGridColumnCount = 5
    private var fumiWidth: CGFloat {
        fumiOriginalWidth * fumiScale
    }
    private let horizontalPadding: CGFloat = 60

    var body: some View {
        ZStack {
            if !vm.isFullScreenMode {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        dismissButton
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 8) {
                        toggleFullScreenButton
                        logButton
                    }
                }
                .padding(.horizontal, horizontalPadding)
                .padding(.top, 32)
            }
            fumi
            VStack {
                Spacer()
                if !vm.isFullScreenMode {
                    dialogueBox
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
        .background(ScreenBackground.japaneseRoom.view)
        .navigationBarHidden(true)
        .onTapGesture {
            if vm.isFullScreenMode {
                vm.updateFullScreenMode(to: false)
            } else {
                vm.proceedDialogue {
                    fumiVM.express(vm.currentDialogueSnapshot.characters[0].expression)
                } endAction: {
                    dismiss()
                }
            }
        }
        .sheet(isPresented: $vm.showsLogSheet) {
            LogSheetView(
                vm: .init(
                    dialogueSnapshots: vm.dialogueLog
                )
            )
            .presentationCompactAdaptation(.sheet)
        }
    }
}

private extension TalkScreenView {
    var dismissButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.thinMaterial)
                Image(systemName: "arrow.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.secondary)
                    .frame(width: 24, height: 24)
            }
        })
        .buttonStyle(.plain)
    }

    var toggleFullScreenButton: some View {
        Button(action: {
            vm.updateFullScreenMode(to: true)
            vm.updateFinishedTypewriting(to: true)
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.thinMaterial)
                Image(systemName: "viewfinder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.secondary)
                    .frame(width: 24, height: 24)
            }
        })
        .buttonStyle(.plain)
    }

    var logButton: some View {
        Button(action: {
            vm.showLogSheet()
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.thinMaterial)
                Image(systemName: "text.page")
                    .resizable()
                    .foregroundStyle(.secondary)
                    .frame(width: 24, height: 24)
            }
        })
        .buttonStyle(.plain)
    }

    var fumi: some View {
        KanojoView(kanojoParts: fumiVM.parts, scale: fumiScale, isUpsideDown: fumiVM.activeAction == .turnUpsideDown)
            .offset(y: 10)
            .opacity(fumiVM.activeAction == .fade ? 0.5 : 1.0)
            .offset(x: fumiVM.activeAction == .shake ? 2 : 0)
            .task {
            }
    }

    var dialogueBox: some View {
        VStack(spacing: 4) {
            HStack {
                // 話者の名前を格納する箱
                Text(vm.currentDialogueSnapshot.activeCharacter
                    .name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .frame(height: 40)
                    .background(.regularMaterial)
                    .cornerRadius(12)
                    .transition(.opacity)
                    .id(vm.currentDialogueSnapshot.activeCharacter
                        .name)
                Spacer()
            }
            // 台詞を格納する箱
            ScrollView {
                HStack(spacing: 0) {
                    TypewriterText(fullText: vm.currentDialogueSnapshot.dialogue, finishedTypewriting: $vm.finishedTypewriting)
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .id(vm.currentDialogueIndex)
                    Spacer()
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
            }
            .background(.regularMaterial)
            .frame(maxHeight: 110)
            .cornerRadius(16)
        }
        .frame(maxWidth: 600)
        .padding(.bottom, 8)
        .ignoresSafeArea()
    }
}
