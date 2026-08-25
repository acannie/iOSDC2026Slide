//
//  Expression.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

struct Expression: Hashable {
    let faceType: FaceType
    let leftEyebrowType: EyebrowType
    let rightEyebrowType: EyebrowType
    let leftEyeType: EyeType
    let rightEyeType: EyeType
    let mouthType: MouthType
    let costumeType: CostumeType
    let faceMaskType: FaceMaskType
    let accessoriesType: AccessoriesType
    let emotionalEmissionType: EmotionalEmissionType
    let leftHandGestureType: GestureType
    let rightHandGestureType: GestureType
    let actionType: ActionType

    init(
        faceType: FaceType,
        eyebrowsType: EyebrowType,
        eyesType: EyeType,
        mouthType: MouthType,
        costumeType: CostumeType = .normal(.normal),
        faceMaskType: FaceMaskType = .nothing,
        accessoriesType: AccessoriesType = .nothing,
        emotionalEmissionType: EmotionalEmissionType = .nothing,
        leftHandGestureType: GestureType = .backhandOutFront(.normal),
        rightHandGestureType: GestureType = .backhandOutFront(.normal),
        actionType: ActionType = .nothing
    ) {
        self.faceType = faceType
        self.leftEyebrowType = eyebrowsType
        self.rightEyebrowType = eyebrowsType
        self.leftEyeType = eyesType
        self.rightEyeType = eyesType
        self.mouthType = mouthType
        self.costumeType = costumeType
        self.faceMaskType = faceMaskType
        self.accessoriesType = accessoriesType
        self.emotionalEmissionType = emotionalEmissionType
        self.leftHandGestureType = leftHandGestureType
        self.rightHandGestureType = rightHandGestureType
        self.actionType = actionType
    }

    init(
        faceType: FaceType,
        eyebrowsType: EyebrowType,
        leftEyeType: EyeType,
        rightEyeType: EyeType,
        mouthType: MouthType,
        costumeType: CostumeType = .normal(.normal),
        faceMaskType: FaceMaskType = .nothing,
        accessoriesType: AccessoriesType = .nothing,
        emotionalEmissionType: EmotionalEmissionType = .nothing,
        leftHandGestureType: GestureType = .backhandOutFront(.normal),
        rightHandGestureType: GestureType = .backhandOutFront(.normal),
        actionType: ActionType = .nothing
    ) {
        self.faceType = faceType
        self.leftEyebrowType = eyebrowsType
        self.rightEyebrowType = eyebrowsType
        self.leftEyeType = leftEyeType
        self.rightEyeType = rightEyeType
        self.mouthType = mouthType
        self.costumeType = costumeType
        self.faceMaskType = faceMaskType
        self.accessoriesType = accessoriesType
        self.emotionalEmissionType = emotionalEmissionType
        self.leftHandGestureType = leftHandGestureType
        self.rightHandGestureType = rightHandGestureType
        self.actionType = actionType
    }

    init(
        faceType: FaceType,
        leftEyebrowType: EyebrowType,
        rightEyebrowType: EyebrowType,
        eyesType: EyeType,
        mouthType: MouthType,
        costumeType: CostumeType = .normal(.normal),
        faceMaskType: FaceMaskType = .nothing,
        accessoriesType: AccessoriesType = .nothing,
        emotionalEmissionType: EmotionalEmissionType = .nothing,
        leftHandGestureType: GestureType = .backhandOutFront(.normal),
        rightHandGestureType: GestureType = .backhandOutFront(.normal),
        actionType: ActionType = .nothing
    ) {
        self.faceType = faceType
        self.leftEyebrowType = leftEyebrowType
        self.rightEyebrowType = rightEyebrowType
        self.leftEyeType = eyesType
        self.rightEyeType = eyesType
        self.mouthType = mouthType
        self.costumeType = costumeType
        self.faceMaskType = faceMaskType
        self.accessoriesType = accessoriesType
        self.emotionalEmissionType = emotionalEmissionType
        self.leftHandGestureType = leftHandGestureType
        self.rightHandGestureType = rightHandGestureType
        self.actionType = actionType
    }

    init(
        faceType: FaceType,
        leftEyebrowType: EyebrowType,
        rightEyebrowType: EyebrowType,
        leftEyeType: EyeType,
        rightEyeType: EyeType,
        mouthType: MouthType,
        costumeType: CostumeType = .normal(.normal),
        faceMaskType: FaceMaskType = .nothing,
        accessoriesType: AccessoriesType = .nothing,
        emotionalEmissionType: EmotionalEmissionType = .nothing,
        leftHandGestureType: GestureType = .backhandOutFront(.normal),
        rightHandGestureType: GestureType = .backhandOutFront(.normal),
        actionType: ActionType = .nothing
    ) {
        self.faceType = faceType
        self.leftEyebrowType = leftEyebrowType
        self.rightEyebrowType = rightEyebrowType
        self.leftEyeType = leftEyeType
        self.rightEyeType = rightEyeType
        self.mouthType = mouthType
        self.costumeType = costumeType
        self.faceMaskType = faceMaskType
        self.accessoriesType = accessoriesType
        self.emotionalEmissionType = emotionalEmissionType
        self.leftHandGestureType = leftHandGestureType
        self.rightHandGestureType = rightHandGestureType
        self.actionType = actionType
    }

    func applyDelta(
        faceType: FaceType? = nil,
        eyebrowType: EyebrowType? = nil,
        eyeType: EyeType? = nil,
        mouthType: MouthType? = nil,
        costumeType: CostumeType? = nil,
        faceMaskType: FaceMaskType? = nil,
        accessoriesType: AccessoriesType? = nil,
        emotionalEmissionType: EmotionalEmissionType? = nil,
        leftHandGestureType: GestureType? = nil,
        rightHandGestureType: GestureType? = nil,
        actionType: ActionType? = nil
    ) -> Self {
        .init(
            faceType: faceType ?? self.faceType,
            leftEyebrowType: eyebrowType ?? self.leftEyebrowType,
            rightEyebrowType: eyebrowType ?? self.rightEyebrowType,
            leftEyeType: eyeType ?? self.leftEyeType,
            rightEyeType: eyeType ?? self.rightEyeType,
            mouthType: mouthType ?? self.mouthType,
            costumeType: costumeType ?? self.costumeType,
            faceMaskType: faceMaskType ?? self.faceMaskType,
            accessoriesType: accessoriesType ?? self.accessoriesType,
            emotionalEmissionType: emotionalEmissionType ?? self.emotionalEmissionType,
            leftHandGestureType: leftHandGestureType ?? self.leftHandGestureType,
            rightHandGestureType: rightHandGestureType ?? self.rightHandGestureType,
            actionType: actionType ?? self.actionType
        )
    }

    func applyDelta(
        faceType: FaceType? = nil,
        leftEyebrowType: EyebrowType? = nil,
        rightEyebrowType: EyebrowType? = nil,
        eyeType: EyeType? = nil,
        mouthType: MouthType? = nil,
        costumeType: CostumeType? = nil,
        faceMaskType: FaceMaskType? = nil,
        accessoriesType: AccessoriesType? = nil,
        emotionalEmissionType: EmotionalEmissionType? = nil,
        leftHandGestureType: GestureType? = nil,
        rightHandGestureType: GestureType? = nil,
        actionType: ActionType? = nil
    ) -> Self {
        .init(
            faceType: faceType ?? self.faceType,
            leftEyebrowType: leftEyebrowType ?? self.leftEyebrowType,
            rightEyebrowType: rightEyebrowType ?? self.rightEyebrowType,
            leftEyeType: eyeType ?? self.leftEyeType,
            rightEyeType: eyeType ?? self.rightEyeType,
            mouthType: mouthType ?? self.mouthType,
            costumeType: costumeType ?? self.costumeType,
            faceMaskType: faceMaskType ?? self.faceMaskType,
            accessoriesType: accessoriesType ?? self.accessoriesType,
            emotionalEmissionType: emotionalEmissionType ?? self.emotionalEmissionType,
            leftHandGestureType: leftHandGestureType ?? self.leftHandGestureType,
            rightHandGestureType: rightHandGestureType ?? self.rightHandGestureType,
            actionType: actionType ?? self.actionType
        )
    }

    func applyDelta(
        faceType: FaceType? = nil,
        eyebrowType: EyebrowType? = nil,
        leftEyeType: EyeType? = nil,
        rightEyeType: EyeType? = nil,
        mouthType: MouthType? = nil,
        costumeType: CostumeType? = nil,
        faceMaskType: FaceMaskType? = nil,
        accessoriesType: AccessoriesType? = nil,
        emotionalEmissionType: EmotionalEmissionType? = nil,
        leftHandGestureType: GestureType? = nil,
        rightHandGestureType: GestureType? = nil,
        actionType: ActionType? = nil
    ) -> Self {
        .init(
            faceType: faceType ?? self.faceType,
            leftEyebrowType: eyebrowType ?? self.leftEyebrowType,
            rightEyebrowType: eyebrowType ?? self.rightEyebrowType,
            leftEyeType: leftEyeType ?? self.leftEyeType,
            rightEyeType: rightEyeType ?? self.rightEyeType,
            mouthType: mouthType ?? self.mouthType,
            costumeType: costumeType ?? self.costumeType,
            faceMaskType: faceMaskType ?? self.faceMaskType,
            accessoriesType: accessoriesType ?? self.accessoriesType,
            emotionalEmissionType: emotionalEmissionType ?? self.emotionalEmissionType,
            leftHandGestureType: leftHandGestureType ?? self.leftHandGestureType,
            rightHandGestureType: rightHandGestureType ?? self.rightHandGestureType,
            actionType: actionType ?? self.actionType
        )
    }

    func applyDelta(
        faceType: FaceType? = nil,
        leftEyebrowType: EyebrowType? = nil,
        rightEyebrowType: EyebrowType? = nil,
        leftEyeType: EyeType? = nil,
        rightEyeType: EyeType? = nil,
        mouthType: MouthType? = nil,
        costumeType: CostumeType? = nil,
        faceMaskType: FaceMaskType? = nil,
        accessoriesType: AccessoriesType? = nil,
        emotionalEmissionType: EmotionalEmissionType? = nil,
        leftHandGestureType: GestureType? = nil,
        rightHandGestureType: GestureType? = nil,
        actionType: ActionType? = nil
    ) -> Self {
        .init(
            faceType: faceType ?? self.faceType,
            leftEyebrowType: leftEyebrowType ?? self.leftEyebrowType,
            rightEyebrowType: rightEyebrowType ?? self.rightEyebrowType,
            leftEyeType: leftEyeType ?? self.leftEyeType,
            rightEyeType: rightEyeType ?? self.rightEyeType,
            mouthType: mouthType ?? self.mouthType,
            costumeType: costumeType ?? self.costumeType,
            faceMaskType: faceMaskType ?? self.faceMaskType,
            accessoriesType: accessoriesType ?? self.accessoriesType,
            emotionalEmissionType: emotionalEmissionType ?? self.emotionalEmissionType,
            leftHandGestureType: leftHandGestureType ?? self.leftHandGestureType,
            rightHandGestureType: rightHandGestureType ?? self.rightHandGestureType,
            actionType: actionType ?? self.actionType
        )
    }
}
