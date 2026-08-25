//
//  MouthViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI

protocol MouthViewModel: ObservableObject {
    func express(_ mouthType: MouthType)
}
