//
//  Kanojo2GestureView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI

struct Kanojo2GestureView: GestureView {
    @ObservedObject var vm: Kanojo2GestureViewModel

    private let skinColor = Color("fumi_skin")

    var body: some View {
        ZStack {
        }
    }
}

private extension Kanojo2GestureView {
    var thinking: some View {
        ZStack {}
    }
}

#Preview {
    FumiGestureView(vm: .init())
}
