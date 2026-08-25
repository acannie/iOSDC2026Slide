//
//  Kanojo2EmotionalEmissionView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI

struct Kanojo2EmotionalEmissionView: EmotionalEmissionView {
    @ObservedObject var vm: Kanojo2EmotionalEmissionViewModel

    var body: some View {
        ZStack {
            switch vm.emotionalEmissionType {
            default:
                EmptyView()
            }
        }
    }
}

private extension Kanojo2EmotionalEmissionView {
}

#Preview {
    Kanojo2EmotionalEmissionView(vm: .init())
}
