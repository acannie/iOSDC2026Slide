//
//  Kanojo2EyesView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct Kanojo2EyesView: EyesView {
    private let whiteOfEyesColor = Color("fumi_whiteOfEyes")
    private let eyelashColor = Color("kanojo2_eyelash")
    private let pupilColorTop = Color("kanojo2_pupil_top")
    private let pupilColorBottom = Color("kanojo2_pupil_bottom")
    private let skinColorDark = Color("kanojo2_skin_dark")

    var body: some View {
        ZStack {
            eye(side: .left)
            eye(side: .right)
        }
    }
}

private extension Kanojo2EyesView {
    func eye(side: Side) -> some View {
        ZStack {
            // 白目
            Image(systemName: "button.angledbottom.horizontal.right.fill")
                .resizable()
                .foregroundStyle(whiteOfEyesColor)
                .rotationEffect(.degrees(side.unit * 20))
                .frame(width: 70, height: 55)
                .offset(x: side.unit * 70, y: -50)
            // 瞳
            pupil
                .frame(width: 45, height: 55)
                .offset(x: side.unit * 65, y: -50)
            // アイライン
            Image(systemName: "phone.down.fill")
                .resizable()
                .foregroundStyle(eyelashColor)
                .rotationEffect(.degrees(side.unit * 7))
                .frame(width: 95, height: 18)
                .offset(x: side.unit * 80, y: -70)
            // 二重線
            Image(
                systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(skinColorDark)
                .rotationEffect(.degrees(side == .left ? 268 : 92))
                .frame(width: 3, height: 70)
                .offset(x: side.unit * 80, y: -86)
            // 上まつ毛
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .foregroundStyle(eyelashColor)
                .rotationEffect(.degrees(side.unit * 95))
                .frame(width: 15, height: 25)
                .offset(x: side.unit * 90, y: -82)
            // 下まつ毛
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .foregroundStyle(eyelashColor)
                .rotationEffect(.degrees(side.unit * 80))
                .frame(width: 5, height: 25)
                .offset(x: side.unit * 85, y: -25)
        }
    }

    var pupil: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [pupilColorTop, pupilColorBottom]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .mask(
                Image(systemName: "circle.fill")
                    .resizable()
            )
        }
    }
}

#Preview {
    Kanojo2EyesView()
}
