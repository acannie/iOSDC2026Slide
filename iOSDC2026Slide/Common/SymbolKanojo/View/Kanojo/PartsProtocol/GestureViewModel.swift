//
//  GestureViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI

protocol GestureViewModel: ObservableObject {
    func express(left leftHandGestureType: GestureType, right rightHandGestureType: GestureType, costumeType: CostumeType)
}
