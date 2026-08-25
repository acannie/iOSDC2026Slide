//
//  FumiAccessoriesViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

import SwiftUI
import Combine

class FumiAccessoriesViewModel: AccessoriesViewModel {
    @Published private(set) var accessoriesType: AccessoriesType = .nothing

    func put(_ accessoriesType: AccessoriesType) {
        withAnimation {
            self.accessoriesType = accessoriesType
        }
    }
}
