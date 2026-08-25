//
//  01_ComparingWithAi.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct ComparingWithAi: View {
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
                ForEach(GirlProducer.allCases, id: \.self) { producer in
                    girl(by: producer)
                }
            }
            .padding(.horizontal, 64)
            Spacer()
        }
    }
}

private enum GirlProducer: String, CaseIterable {
    case akane = "ささおか\nあかね"
    case chatgpt = "ChatGPT"
    case gemini = "Gemini"
    case claude = "Claude"
}

private extension ComparingWithAi {
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
            caption(producer.rawValue)
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

    func caption(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 50, weight: .semibold, design: .rounded))
            .foregroundStyle(.commonText)
            .multilineTextAlignment(.center)
    }
}
