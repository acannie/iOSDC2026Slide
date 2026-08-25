//
//  EyebrowsViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI

protocol EyebrowsViewModel: ObservableObject {
    func express(_ eyebrowType: EyebrowType)
    func express(left leftEyebrowType: EyebrowType, right rightEyebrowType: EyebrowType)
}
