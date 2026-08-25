//
//  Language.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

enum Language: String, CaseIterable {
    case zh = "zh"
    case en = "en"
    case vn = "vn"
    case ja = "ja"

    var text: String {
        switch self {
        case .zh: "Chinese"
        case .en: "English"
        case .vn: "Tiếng Việt"
        case .ja: "日本語"
        }
    }
}
