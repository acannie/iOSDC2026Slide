//
//  AccessoriesViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

import SwiftUI

protocol AccessoriesViewModel: ObservableObject {
    func put(_ accessoriesType: AccessoriesType)
}
