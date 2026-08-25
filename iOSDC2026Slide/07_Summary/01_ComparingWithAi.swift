//
//  01_ComparingWithAi.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct ComparingWithAi: View {
    @State private var isShowingAiGirl: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            Spacer()
            HStack {
                girl(by: .akane)
                ForEach(Array(GirlProducer.allCases.enumerated()), id: \.offset) { index, producer in
                    if index > 0 {
                        girl(by: producer)
                            .opacity(isShowingAiGirl ? 1 : 0)
                            .animation(
                                .easeInOut.delay(Double(index - 1) * 0.3),
                                value: isShowingAiGirl
                            )
                    }
                }
            }
            .padding(.horizontal, 64)
            Spacer()
        }
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    toggleDayAndNightButton
                    Spacer()
                }
            }
        }
    }
}

private enum GirlProducer: String, CaseIterable {
    case akane = "ささおかあかね"
    case chatgpt = "ChatGPT"
    case gemini = "Gemini"
    case claude = "Claude"
}

private extension ComparingWithAi {
    var toggleDayAndNightButton: some View {
        Button(action: {
            isShowingAiGirl.toggle()
        }) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 100, height: 100)
        }
    }

    var title: some View {
        Text("AIとの比較")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    func girl(by producer: GirlProducer) -> some View {
        VStack(spacing: 8) {
            Group {
                switch producer {
                case .akane: akaneGirl
                case .chatgpt: chatGptGirl
                case .gemini: geminiGirl
                case .claude: claudeGirl
                }
            }
            .frame(height: 300)
            caption(for: producer)
        }
        .frame(width: 320)
    }

    var akaneGirl: some View {
        BustUpKanojoView(
            kanojoParts: Fumi(
                faceViewModel: .init(),
                eyebrowsViewModel: .init(),
                eyesViewModel: .init(),
                mouthViewModel: .init(),
                costumeViewModel: .init(),
                faceMaskViewModel: .init(),
                accessoriesViewModel: .init(),
                emotionalEmissionViewModel: .init(),
                gestureViewModel: .init()
            ),
            scale: 1.0,
            isUpsideDown: false
        )
        .scaleEffect(0.5)
    }

    var geminiGirl: some View {
        GeminiGirlView()
            .offset(y: -100)
            .scaleEffect(0.5)
    }

    var chatGptGirl: some View {
        ChatGptGirlView()
    }

    var claudeGirl: some View {
        ClaudeGirlView()
            .offset(y: -50)
            .scaleEffect(0.8)
    }

    func caption(for producer: GirlProducer) -> some View {
        Text(producer.rawValue)
            .font(.system(size: producer == .akane ? 30 : 50, weight: .semibold, design: .rounded))
            .foregroundStyle(.commonText)
            .multilineTextAlignment(.center)
    }
}
