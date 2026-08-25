//
//  TypewriterText.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/07.
//

import SwiftUI

struct TypewriterText: View {
    private let fullText: String
    private let typingSpeed: TimeInterval = 0.03

    @State private var currentText = ""
    @State private var charIndex = 0
    @State private var timer: Timer?
    @Binding private var finishedTypewriting: Bool

    init(fullText: String, finishedTypewriting: Binding<Bool>) {
        self.fullText = fullText
        self._finishedTypewriting = finishedTypewriting
    }

    var body: some View {
        Text(currentText)
            .onAppear {
                if finishedTypewriting {
                    currentText = fullText
                } else {
                    startTyping()
                }
            }
            .onDisappear {
                timer?.invalidate()
            }
    }
}

private extension TypewriterText {
    func startTyping() {
        currentText = ""
        charIndex = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: typingSpeed, repeats: true) { _ in
            if charIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: charIndex)
                currentText.append(fullText[index])
                charIndex += 1
            } else {
                timer?.invalidate()
            }
        }
    }
}
