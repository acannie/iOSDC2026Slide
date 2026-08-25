//
//  CostumeViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

import SwiftUI

protocol CostumeViewModel: ObservableObject {
    func express(_ costumeType: CostumeType)
}
