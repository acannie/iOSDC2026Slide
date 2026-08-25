//
//  FaceViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/02.
//

import SwiftUI

protocol FaceViewModel: ObservableObject {
    func express(_ faceType: FaceType)
}
