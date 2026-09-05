//
//  YuyuFaceMaskView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/08.
//

import SwiftUI

struct YuyuFaceMaskView: FaceMaskView {
    @ObservedObject var vm: YuyuFaceMaskViewModel

    var body: some View {
        switch vm.faceMaskType {
        case .faceMask:
            faceMask
        case .roundGlassesAndMustache:
            roundGlassesAndMustache
        case .nothing:
            EmptyView()
        }
    }
}

private extension YuyuFaceMaskView {
    var faceMask: some View {
        Image(systemName: "facemask.fill")
            .resizable()
            .symbolRenderingMode(.palette)
            .foregroundStyle(.maskDark, .maskLight)
            .frame(width: 270, height: 80)
            .offset(y: 20)
    }

    var roundGlassesAndMustache: some View {
        ZStack {
            Image(systemName: "eyeglasses")
                .resizable()
                .fontWeight(.thin)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.roundGlassesEdge)
                .frame(width: 280)
                .offset(y: -50)
            Image(systemName: "mustache.fill")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yuyuFrontHair)
                .frame(width: 120, height: 40)
                .offset(y: 20)
        }
    }
}

#Preview {
    YuyuFaceMaskView(vm: .init())
}
