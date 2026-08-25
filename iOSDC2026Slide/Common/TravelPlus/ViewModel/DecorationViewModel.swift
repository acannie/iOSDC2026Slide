//
//  DecorationViewModel.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI
import Combine

class DecorationViewModel: ObservableObject {
    @Binding var city: City?

    init(city: Binding<City?>) {
        self._city = city
    }
}
