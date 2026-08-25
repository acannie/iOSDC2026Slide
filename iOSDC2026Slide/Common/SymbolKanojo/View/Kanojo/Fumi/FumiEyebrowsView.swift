//
//  FumiEyebrowsView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct FumiEyebrowsView: EyebrowsView {
    @ObservedObject var vm: FumiEyebrowsViewModel

    private let eyebrowColor = Color("fumi_eyebrow")

    var body: some View {
        ZStack {
            eyebrow(side: .left)
            eyebrow(side: .right)
        }
    }
}
    
private extension FumiEyebrowsView {
    func eyebrow(side: Side) -> some View {
        Image(
            systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
            .resizable()
            .foregroundStyle(eyebrowColor)
            .rotationEffect(eyebrowAngle(
                Angle(degrees: side == .left ? 95 : 265),
                side: side
            ))
            .frame(width: 5, height: 70)
            .offset(
                x: side.unit * -70,
                y: eyebrowOffsetY(-110, side: side)
            )
    }
}

private extension FumiEyebrowsView {
    func eyebrowAngle(_ angle: Angle, side: Side) -> Angle {
        let eyebrowType = side == .left ? vm.leftEyebrowType : vm.rightEyebrowType
        return switch eyebrowType {
        case .neutral, .surprise:
            angle
        case .anger:
            angle + Angle(degrees: side.unit * 15.0)
        case .sadness:
            angle + Angle(degrees: side.unit * -10.0)
        }
    }

    func eyebrowOffsetY(_ offsetY: CGFloat, side: Side) -> CGFloat {
        let eyebrowType = side == .left ? vm.leftEyebrowType : vm.rightEyebrowType
        return switch eyebrowType {
        case .neutral, .anger, .sadness:
            offsetY
        case .surprise:
            offsetY - 10.0
        }
    }
}

#Preview {
    FumiEyebrowsView(vm: .init())
}
