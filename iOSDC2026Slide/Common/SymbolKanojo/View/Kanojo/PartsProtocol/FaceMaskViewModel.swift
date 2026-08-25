//
//  FaceMaskViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/08.
//

import SwiftUI

protocol FaceMaskViewModel: ObservableObject {
    func express(_ faceMaskType: FaceMaskType)
}
