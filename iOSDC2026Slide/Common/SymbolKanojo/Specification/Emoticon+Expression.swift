//
//  Emoticon+Expression.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

extension Emoticon {
    var expression: Expression {
        switch self {
        case .😀: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .happy(.large, nil)
        )
        case .😃: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.surprise, .normal, .center),
            mouthType: .happy(.large, nil)
        )
        case .😄: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .happy(.large, nil)
        )
        case .😁: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .smileMischievously(.large)
        )
        case .😆: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .closeTightly,
            mouthType: .happy(.large, nil)
        )
        case .🥹: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .teary, .center),
            mouthType: .smile(.medium, nil),
            emotionalEmissionType: .tear(.moist)
        )
        case .😅: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.smile, .normal, .center),
            mouthType: .happy(.large, nil),
            emotionalEmissionType: .sweat
        )
        case .😂: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .laughter,
            mouthType: .happy(.large, nil),
            emotionalEmissionType: .tear(.weep)
        )
        case .🤣: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .closeTightly,
            mouthType: .happy(.large, nil),
            emotionalEmissionType: .tear(.weep)
        )
        case .🥲: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .smile(.medium, nil),
            emotionalEmissionType: .tear(.weep)
        )
        case .😊: .init(
            faceType: .hot,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .smile(.large, nil)
        )
        case .😇: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .smile(.large, nil),
            emotionalEmissionType: .halo
        )
        case .🙂: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .smile(.medium, nil)
        )
        case .🙃: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .smile(.medium, nil),
            actionType: .turnUpsideDown
        )
        case .😉: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            leftEyeType: .normal(.smile, .normal, .center),
            rightEyeType: .laughter,
            mouthType: .smile(.medium, nil)
        )
        case .😌: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .close,
            mouthType: .smile(.medium, nil)
        )
        case .😍: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.smile, .heart, .center),
            mouthType: .happy(.medium, nil),
            emotionalEmissionType: .heart
        )
        case .🥰: .init(
            faceType: .hot,
            eyebrowsType: .neutral,
            eyesType: .normal(.smile, .normal, .center),
            mouthType: .smile(.medium, nil),
            emotionalEmissionType: .heart
        )
        case .😘: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            leftEyeType: .normal(.smile, .normal, .center),
            rightEyeType: .laughter,
            mouthType: .kiss,
            emotionalEmissionType: .heart
        )
        case .😗: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .kiss
        )
        case .😙: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .kiss
        )
        case .😚: .init(
            faceType: .hot,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .kiss
        )
        case .😋: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.smile, .normal, .center),
            mouthType: .smile(.large, .licking)
        )
        case .😛: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .happy(.large, .tongueOut)
        )
        case .😝: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .closeTightly,
            mouthType: .happy(.large, .tongueOut)
        )
        case .😜: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            leftEyeType: .laughter,
            rightEyeType: .normal(.smile, .normal, .center),
            mouthType: .happy(.large, .tongueOut)
        )
        case .🤪: .init(
            faceType: .neutral,
            eyebrowsType: .surprise,
            eyesType: .normal(.surprise, .normal, .top),
            mouthType: .happy(.large, .tongueOut)
        )
        case .🤨: .init(
            faceType: .neutral,
            leftEyebrowType: .anger,
            rightEyebrowType: .surprise,
            leftEyeType: .normal(.anger, .normal, .center),
            rightEyeType: .normal(.surprise, .normal, .center),
            mouthType: .neutral(.large)
        )
        case .🧐: .init(
            faceType: .neutral,
            leftEyebrowType: .anger,
            rightEyebrowType: .surprise,
            leftEyeType: .normal(.anger, .normal, .center),
            rightEyeType: .normal(.surprise, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            accessoriesType: .monocle
        )
        case .🤓: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .smileMischievously(.medium),
            accessoriesType: .glasses
        )
        case .😎: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .smile(.medium, nil),
            accessoriesType: .sunglasses
        )
        case .🥸: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .neutral(.medium),
            faceMaskType: .roundGlassesAndMustache
        )
        case .🤩: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .star, .center),
            mouthType: .happy(.large, nil)
        )
        case .🥳: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .laughter,
            mouthType: .kiss,
            accessoriesType: .party,
            emotionalEmissionType: .confetti
        )
        case .😏: .init(
            faceType: .neutral,
            eyebrowsType: .anger,
            eyesType: .normal(.dissatisfaction, .normal, .right),
            mouthType: .smile(.medium, nil)
        )
        case .😒: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.dissatisfaction, .normal, .right),
            mouthType: .dissatisfaction(.medium)
        )
        case .😞: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .close,
            mouthType: .dissatisfaction(.medium)
        )
        case .😔: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .close,
            mouthType: .neutral(.medium)
        )
        case .😟: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .wailing(.medium, nil)
        )
        case .😕: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .dissatisfaction(.medium)
        )
        case .🙁: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .dissatisfaction(.large)
        )
        case .😣: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .closeTightly,
            mouthType: .wailing(.medium, nil)
        )
        case .😖: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .closeTightly,
            mouthType: .defeated
        )
        case .😫: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .closeTightly,
            mouthType: .wailing(.large, nil)
        )
        case .😩: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .close,
            mouthType: .wailing(.large, nil)
        )
        case .🥺: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .teary, .center),
            mouthType: .dissatisfaction(.medium),
            emotionalEmissionType: .tear(.moist)
        )
        case .😢: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            emotionalEmissionType: .tear(.weep)
        )
        case .😭: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .close,
            mouthType: .surprise(.medium),
            emotionalEmissionType: .tear(.sob)
        )
        case .😤: .init(
            faceType: .neutral,
            eyebrowsType: .anger,
            eyesType: .close,
            mouthType: .dissatisfaction(.large)
        )
        case .😠: .init(
            faceType: .neutral,
            eyebrowsType: .anger,
            eyesType: .normal(.anger, .normal, .center),
            mouthType: .dissatisfaction(.medium)
        )
        case .😡: .init(
            faceType: .hot,
            eyebrowsType: .anger,
            eyesType: .normal(.anger, .normal, .center),
            mouthType: .dissatisfaction(.medium)
        )
        case .🤬: .init(
            faceType: .hot,
            eyebrowsType: .anger,
            eyesType: .normal(.anger, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            emotionalEmissionType: .grawlix,
            actionType: .shake
        )
        case .🤯: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.surprise, .normal, .center),
            mouthType: .wailing(.medium, nil),
            emotionalEmissionType: .explode
        )
        case .😳: .init(
            faceType: .hot,
            eyebrowsType: .surprise,
            eyesType: .normal(.surprise, .normal, .center),
            mouthType: .neutral(.medium)
        )
        case .🥵: .init(
            faceType: .hot,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .normal, .center),
            mouthType: .wailing(.medium, .tongueOut),
            emotionalEmissionType: .sweat
        )
        case .🥶: .init(
            faceType: .cold,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .grittedTeeth,
            actionType: .shake
        )
        case .😶‍🌫️: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .neutral(.medium),
            emotionalEmissionType: .smoke
        )
        case .😱: .init(
            faceType: .cold,
            eyebrowsType: .neutral,
            eyesType: .normal(.surprise, .normal, .center),
            mouthType: .surprise(.large),
            leftHandGestureType: .backhandOutFront(.faceHoldShock),
            rightHandGestureType: .backhandOutFront(.faceHoldShock)
        )
        case .😨: .init(
            faceType: .cold,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .wailing(.medium, nil)
        )
        case .😰: .init(
            faceType: .cold,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .normal, .center),
            mouthType: .wailing(.medium, nil),
            emotionalEmissionType: .sweat
        )
        case .😥: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .normal, .center),
            mouthType: .wailing(.medium, nil),
            emotionalEmissionType: .sweat
        )
        case .😓: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .close,
            mouthType: .wailing(.medium, nil),
            emotionalEmissionType: .sweat
        )
        case .🤗: .init(
            faceType: .hot,
            eyebrowsType: .neutral,
            eyesType: .normal(.smile, .normal, .center),
            mouthType: .smile(.medium, nil),
            leftHandGestureType: .palmOutFront(.waving),
            rightHandGestureType: .palmOutFront(.waving)
        )
        case .🤔: .init(
            faceType: .neutral,
            leftEyebrowType: .surprise,
            rightEyebrowType: .anger,
            leftEyeType: .normal(.surprise, .normal, .center),
            rightEyeType: .normal(.anger, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            leftHandGestureType: .thumbIndexUp(.thinking)
        )
        case .🫣: .init(
            faceType: .hot,
            eyebrowsType: .surprise,
            eyesType: .normal(.surprise, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            leftHandGestureType: .backhandOutFront(.coverEyes),
            rightHandGestureType: .backhandOutFront(.coverEyes)
        )
        case .🤭: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .laughter,
            mouthType: .smile(.medium, nil),
            leftHandGestureType: .backhandOutFront(.coverMouth)
        )
        case .🫢: .init(
            faceType: .neutral,
            eyebrowsType: .surprise,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .surprise(.medium),
            leftHandGestureType: .backhandOutFront(.coverMouth)
        )
        case .🫡: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .neutral(.medium),
            leftHandGestureType: .palmOutFront(.salute)
        )
        case .🤫: .init(
            faceType: .neutral,
            eyebrowsType: .surprise,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .kiss,
            leftHandGestureType: .shushFinger(.shush)
        )
        case .🫠: .init(
            faceType: .melting,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .smile(.large, nil)
        )
        case .🤥: .init(
            faceType: .neutral,
            leftEyebrowType: .sadness,
            rightEyebrowType: .surprise,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .dissatisfaction(.medium)
        )
        case .😶: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .lifeless, .center),
            mouthType: .neutral(.medium)
        )
        case .🫥: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .neutral(.large),
            actionType: .fade
        )
        case .😐: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .neutral(.large)
        )
        case .🫤: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .tilted(.large)
        )
        case .😑: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .close,
            mouthType: .neutral(.large)
        )
        case .🫨: .init(
            faceType: .neutral,
            eyebrowsType: .surprise,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .surprise(.medium),
            actionType: .shake
        )
        case .😬: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .grittedTeeth
        )
        case .🙄: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.surprise, .normal, .top),
            mouthType: .neutral(.medium)
        )
        case .😯: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .surprise(.small)
        )
        case .😦: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .wailing(.medium, nil)
        )
        case .😧: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .wailing(.medium, nil)
        )
        case .😮: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.surprise, .normal, .center),
            mouthType: .surprise(.medium)
        )
        case .😲: .init(
            faceType: .neutral,
            eyebrowsType: .surprise,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .surprise(.medium)
        )
        case .🥱: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.sleepy, .normal, .center),
            mouthType: .surprise(.large),
            leftHandGestureType: .backhandOutFront(.coverMouth)
        )
        case .😴: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .close,
            mouthType: .surprise(.small),
            emotionalEmissionType: .snore
        )
        case .🤤: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.smile, .normal, .center),
            mouthType: .happy(.medium, nil),
            emotionalEmissionType: .drool
        )
        case .😪: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .close,
            mouthType: .wailing(.medium, nil),
            emotionalEmissionType: .snot(.bubble)
        )
        case .😮‍💨: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .close,
            mouthType: .surprise(.small)
        )
        case .😵: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .knockout, .center),
            mouthType: .surprise(.large)
        )
        case .😵‍💫: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .dizzy, .center),
            mouthType: .defeated
        )
        case .🤐: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .zipper
        )
        case .🥴: .init(
            faceType: .hot,
            leftEyebrowType: .anger,
            rightEyebrowType: .surprise,
            leftEyeType: .normal(.anger, .normal, .center),
            rightEyeType: .normal(.surprise, .normal, .center),
            mouthType: .smile(.large, nil)
        )
        case .🤢: .init(
            faceType: .cold,
            eyebrowsType: .sadness,
            eyesType: .normal(.sadness, .normal, .center),
            mouthType: .dissatisfaction(.large)
        )
        case .🤮: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .closeTightly,
            mouthType: .wailing(.large, nil),
            emotionalEmissionType: .vomit
        )
        case .🤧: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .closeTightly,
            mouthType: .defeated,
            emotionalEmissionType: .snot(.drop)
        )
        case .😷: .init(
            faceType: .hot,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .neutral(.medium),
            faceMaskType: .faceMask
        )
        case .🤒: .init(
            faceType: .hot,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            accessoriesType: .thermometer
        )
        case .🤕: .init(
            faceType: .neutral,
            eyebrowsType: .sadness,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            accessoriesType: .injury
        )
        case .🤑: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .money, .center),
            mouthType: .happy(.large, .tongueOut)
        )
        case .🤠: .init(
            faceType: .neutral,
            eyebrowsType: .neutral,
            eyesType: .normal(.neutral, .normal, .center),
            mouthType: .happy(.large, nil),
            accessoriesType: .hat
        )
        case .😈: .init(
            faceType: .neutral,
            eyebrowsType: .anger,
            eyesType: .normal(.anger, .normal, .center),
            mouthType: .smile(.medium, nil),
            costumeType: .normal(.devil),
            emotionalEmissionType: .horns
        )
        case .👿: .init(
            faceType: .neutral,
            eyebrowsType: .anger,
            eyesType: .normal(.anger, .normal, .center),
            mouthType: .dissatisfaction(.medium),
            costumeType: .normal(.devil),
            emotionalEmissionType: .horns
        )
        }
    }
}
