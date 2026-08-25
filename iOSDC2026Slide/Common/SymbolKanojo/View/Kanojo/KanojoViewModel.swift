//
//  KanojoViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI

protocol KanojoViewModel: ObservableObject {
    func express(_ expression: Expression)
}
