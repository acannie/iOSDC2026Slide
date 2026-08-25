//
//  EyesViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI

protocol EyesViewModel: ObservableObject {
    func express(_ eyeType: EyeType)
    func express(left leftEyeType: EyeType, right rightEyeType: EyeType)
}
