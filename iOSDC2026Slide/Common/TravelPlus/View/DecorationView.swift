//
//  DecorationView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI
import Combine

struct DecorationView: View {
    @ObservedObject private var vm: DecorationViewModel

    init(vm: DecorationViewModel) {
        self.vm = vm
    }

    var body: some View {
        ZStack {
            BangkokDecorationView(city: $vm.city)
            HoChiMinhDecorationView(city: $vm.city)
            SeoulDecorationView(city: $vm.city)
            TaipeiDecorationView(city: $vm.city)
            TokyoDecorationView(city: $vm.city)
        }
    }
}
