//
//  City.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

enum City: CaseIterable {
    case bangkok
    case hoChiMinh
    case seoul
    case taipei
    case tokyo

    var text: String {
        switch self {
        case .bangkok: "Bangkok"
        case .hoChiMinh: "Ho Chi Minh"
        case .seoul: "Seoul"
        case .taipei: "Taipei"
        case .tokyo: "Tokyo"
        }
    }

    var country: Country {
        switch self {
        case .bangkok: .thailand
        case .hoChiMinh: .vietnum
        case .seoul: .korea
        case .taipei: .taiwan
        case .tokyo: .japan
        }
    }

    var skyColor: Color {
        switch self {
        case .bangkok: Color("bangkok_sky")
        case .hoChiMinh: Color("hoChiMinh_sky")
        case .seoul: Color("seoul_sky")
        case .taipei: Color("taipei_sky")
        case .tokyo: Color("tokyo_sky")
        }
    }

    var themeColor: Color {
        switch self {
        case .bangkok: Color("bangkok_theme")
        case .hoChiMinh: Color("hoChiMinh_theme")
        case .seoul: Color("seoul_theme")
        case .taipei: Color("taipei_theme")
        case .tokyo: Color("tokyo_theme")
        }
    }

    var subThemeColor: Color {
        switch self {
        case .bangkok: Color("bangkok_subTheme")
        case .hoChiMinh: Color("hoChiMinh_subTheme")
        case .seoul: Color("seoul_subTheme")
        case .taipei: Color("taipei_subTheme")
        case .tokyo: Color("tokyo_subTheme")
        }
    }
}

