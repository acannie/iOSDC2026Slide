//
//  CostumeType.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

enum CostumeType: Hashable {
    case normal(NormalCostumeType)

    enum NormalCostumeType {
        case normal
        case devil
    }
}
