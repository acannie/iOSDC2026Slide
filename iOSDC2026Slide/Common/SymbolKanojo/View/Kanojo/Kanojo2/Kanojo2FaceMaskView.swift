//
//  FumiFaceMaskView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/08.
//

import SwiftUI

struct Kanojo2FaceMaskView: FaceMaskView {
    @ObservedObject var vm: Kanojo2FaceMaskViewModel

    var body: some View {
        ZStack {
        }
    }
}

#Preview {
    Kanojo2FaceMaskView(vm: .init())
}
