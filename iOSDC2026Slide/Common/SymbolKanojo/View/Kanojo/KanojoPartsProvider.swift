//
//  KanojoPartsProvider.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/20.
//

import SwiftUI

/// カノジョを形作るパーツの寄せ集め
protocol KanojoPartsProvider {
    associatedtype BackHairType: BackHairView
    associatedtype BangsType: BangsView
    associatedtype FaceType: FaceView
    associatedtype EyebrowsType: EyebrowsView
    associatedtype EyesType: EyesView
    associatedtype MouthType: MouthView
    associatedtype CostumeType: CostumeView
    associatedtype AccessoriesType: AccessoriesView
    associatedtype FaceMaskType: FaceMaskView
    associatedtype EmotionalEmissionType: EmotionalEmissionView
    associatedtype GestureType: GestureView

    var backHair: BackHairType { get }
    var bangs: BangsType { get }
    var face: FaceType { get }
    var eyebrows: EyebrowsType { get }
    var eyes: EyesType { get }
    var mouth: MouthType { get }
    var costume: CostumeType { get }
    var accessories: AccessoriesType { get }
    var faceMask: FaceMaskType { get }
    var emotionalEmission: EmotionalEmissionType { get }
    var gesture: GestureType { get }
}
