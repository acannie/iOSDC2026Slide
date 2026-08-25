//
//  LogSheetView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/10.
//

import SwiftUI

struct LogSheetView: View {
    @ObservedObject private var vm: LogSheetViewModel

    init(vm: LogSheetViewModel) {
        self.vm = vm
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(vm.dialogueSnapshots, id: \.self) { dialogueSnapshot in
                        logRow(dialogueSnapshot: dialogueSnapshot)
                    }
                }
                .padding(.vertical, 18)
                .padding(.horizontal, 24)
            }
            .background(.regularMaterial)
            .onAppear {
                if let last = vm.dialogueSnapshots.last {
                    proxy.scrollTo(last, anchor: .bottom)
                }
            }
        }
    }
}

private extension LogSheetView {
    func logRow(dialogueSnapshot: DialogueSnapshot) -> some View {
        HStack(alignment: .top, spacing: 12) {
            HStack(spacing: 0) {
                Text(dialogueSnapshot.activeCharacter.name)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                Spacer()
            }
            .frame(width: 50)
            HStack(spacing: 0) {
                Text(dialogueSnapshot.dialogue)
                    .fontWeight(.regular)
                    .foregroundStyle(.primary)
                Spacer()
            }
        }
    }
}

#Preview {
    LogSheetView(vm: .init(dialogueSnapshots: []))
}
