//
//  EyeType.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

import SwiftUI

enum EyeType: Hashable {
    case normal(ExpressionType, IrisType, IrisPosition)
    case laughter
    case close
    case closeTightly

    enum ExpressionType {
        case neutral
        case anger
        case sadness
        case smile
        case surprise
        case dissatisfaction
        case sleepy

        var upperEyelashesOffsetY: CGFloat {
            switch self {
            case .neutral, .anger:
                0.0
            case .sadness, .smile:
                5.0
            case .dissatisfaction, .sleepy:
                10.0
            case .surprise:
                -5.0
            }
        }

        var lowerEyelashesOffsetY: CGFloat {
            switch self {
            case .neutral, .anger, .sadness, .smile, .dissatisfaction, .sleepy:
                0.0
            case .surprise:
                5.0
            }
        }

        func eyeAngle(side: Side) -> Angle {
            switch self {
            case .neutral, .surprise, .dissatisfaction, .sleepy:
                .zero
            case .anger:
                Angle(degrees: side.unit * -10.0)
            case .sadness, .smile:
                Angle(degrees: side.unit * 5.0)
            }
        }

        var eyeHeight: CGFloat {
            switch self {
            case .neutral:
                0.0
            case .sadness, .smile:
                -10.0
            case .dissatisfaction, .sleepy:
                -15.0
            case .anger:
                5.0
            case .surprise:
                10.0
            }
        }
    }

    enum IrisType {
        case normal
        case heart
        case teary
        case dizzy
        case star
        case knockout
        case money
        case lifeless
    }

    enum IrisPosition {
        case center
        case top
        case bottom
        case left
        case right

        var irisOffset: CGPoint {
            switch self {
            case .center:
                .zero
            case .left:
                CGPoint(x: -7, y: .zero)
            case .right:
                CGPoint(x: 7, y: .zero)
            case .top:
                CGPoint(x: .zero, y: -7)
            case .bottom:
                CGPoint(x: .zero, y: 7)
            }
        }
    }
}
