//
//  EmotionalEmissionViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI

protocol EmotionalEmissionViewModel: ObservableObject {
    func express(_ emotionalEmissionType: EmotionalEmissionType)
}
