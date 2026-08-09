//
//  DestinationButtonOverlayView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/10.
//

import SwiftUI

struct DestinationButtonOverlayView: View {
    let goPreviousAction: () -> Void
    let goNextAction: () -> Void

    var body: some View {
        VStack {
            Spacer()
            HStack {
                clearButton { goPreviousAction() }
                Spacer()
                clearButton { goNextAction() }
            }
        }
    }
}

private extension DestinationButtonOverlayView {
    func clearButton(_ action: @escaping () -> Void) -> some View {
        Button(
            action: { action() },
            label: {
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(width: 100, height: 100)
            }
        )
    }
}
