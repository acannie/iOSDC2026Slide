//
//  FumiFaceMaskViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/08.
//

import SwiftUI
import Combine

class FumiFaceMaskViewModel: FaceMaskViewModel {
    @Published private(set) var faceMaskType: FaceMaskType = .nothing

    func express(_ faceMaskType: FaceMaskType) {
        withAnimation {
            self.faceMaskType = faceMaskType
        }
    }
}
