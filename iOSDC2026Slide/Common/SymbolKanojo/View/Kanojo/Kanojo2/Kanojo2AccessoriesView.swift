//
//  Kanojo2AccessoriesView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

import SwiftUI

struct Kanojo2AccessoriesView: AccessoriesView {
    @ObservedObject var vm: Kanojo2AccessoriesViewModel

    var body: some View {
        ZStack {
        }
    }
}

#Preview {
    Kanojo2AccessoriesView(vm: .init())
}
