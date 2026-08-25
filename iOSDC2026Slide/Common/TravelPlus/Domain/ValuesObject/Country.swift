//
//  Country.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

enum Country {
    case thailand
    case vietnum
    case korea
    case taiwan
    case japan

    var emoji: String {
        switch self {
        case .thailand: "🇹🇭"
        case .vietnum: "🇻🇳"
        case .korea: "🇰🇷"
        case .taiwan: "🇹🇼"
        case .japan: "🇯🇵"
        }
    }
}
