//
//  FumiFaceMaskView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/08.
//

import SwiftUI

struct FumiFaceMaskView: FaceMaskView {
    @ObservedObject var vm: FumiFaceMaskViewModel

    private let maskColorLight = Color("mask_light")
    private let maskColorDark = Color("mask_dark")
    private let roundGlassesEdgeColor = Color("roundGlasses_edge")
    private let mustacheColor = Color("fumi_frontHair")

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

private extension FumiFaceMaskView {
    var faceMask: some View {
        Image(systemName: "facemask.fill")
            .resizable()
            .symbolRenderingMode(.palette)
            .foregroundStyle(maskColorDark, maskColorLight)
            .frame(width: 270, height: 80)
            .offset(y: 20)
    }

    var roundGlassesAndMustache: some View {
        ZStack {
            Image(systemName: "eyeglasses")
                .resizable()
                .fontWeight(.thin)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(roundGlassesEdgeColor)
                .frame(width: 280)
                .offset(y: -50)
            Image(systemName: "mustache.fill")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(mustacheColor)
                .frame(width: 120, height: 40)
                .offset(y: 20)
        }
    }
}

#Preview {
    FumiFaceMaskView(vm: .init())
}
