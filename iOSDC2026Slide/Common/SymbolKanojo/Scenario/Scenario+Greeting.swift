//
//  ScenarioGreeting.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

struct ScenarioGreeting {
    static let dialogueSnapshots: [DialogueSnapshot] = [
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "……。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🫢.expression)
            ],
            dialogue: "まあ、あなたは3次元の人間？",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😳.expression.applyDelta(leftHandGestureType: .backhandOutFront(.coverMouth)))
            ],
            dialogue: "驚いた。目の前で見るなんていつぶりだろう。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😲.expression)
            ],
            dialogue: "……あ、名乗りもせず一方的に話しちゃってごめんね。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "自己紹介するね。私、符美。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😊.expression)
            ],
            dialogue: "『ふみ』って読むの。よろしくね。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😀.expression)
            ],
            dialogue: "今こうしておしゃべりできてるってことは、アプリをインストールしてくれたってことだよね。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😄.expression)
            ],
            dialogue: "私、「インストール」知ってる。あなたのお家へ降臨するって意味でしょ。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😮.expression)
            ],
            dialogue: "……違うの？",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😕.expression)
            ],
            dialogue: "まあいいや。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😲.expression)
            ],
            dialogue: "あなたを見て珍しいと言ったのは、私が2次元だから。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "私の体ね、記号で出来てるの。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😃.expression)
            ],
            dialogue: "よく見て、私のアイライン。何かに似てると思わない？",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🥴.expression.applyDelta(faceType: .neutral, mouthType: .smile(.medium, nil)))
            ],
            dialogue: "正解は、受話器！",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😄.expression)
            ],
            dialogue: "自慢なの。3次元じゃありえないでしょ。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😊.expression.applyDelta(faceType: .neutral))
            ],
            dialogue: "あなたのまつ毛もブラシみたいで素敵だね。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "この世界では、記号でできた女の子たちをシンボル・ガールと呼ぶんだよ。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😀.expression)
            ],
            dialogue: "シンボル・ガールと3次元の人間の違いは、見た目だけじゃないの。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🤩.expression)
            ],
            dialogue: "私たちシンボルだから、あなたたちの世界で言うアニメ的表現が得意。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🫠.expression.applyDelta(mouthType: .happy(.large, .tongueOut)))
            ],
            dialogue: "こんなこともできちゃう。必殺、顔スライム！私の得意技！",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😕.expression)
            ],
            dialogue: "逆にね、シンボルの世界に新たな概念を生み出すことは3次元の人間にしかできないんだ。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😯.expression)
            ],
            dialogue: "たとえば、雪玉を組み合わせて雪だるまを作ることはシンボル・ガールにもできるけれど、",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🥰.expression.applyDelta(faceType: .neutral, emotionalEmissionType: .nothing))
            ],
            dialogue: "記号や幾何学的な図形から雪玉を生み出すことは、あなたたちにしかできないの。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😏.expression)
            ],
            dialogue: "この違い、分かる？",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "抽象的な形を具体的な概念に落とし込む操作は、高次元の存在にしか為し得ないことなんだよ。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🥰.expression)
            ],
            dialogue: "シンボル・ガールは、3次元の世界に興味津々。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😊.expression)
            ],
            dialogue: "あなたの力で、たくさんの3次元の概念をこの世界にもたらしてほしいの。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😲.expression)
            ],
            dialogue: "それとね、このアプリを作った人から伝言を預かっているよ。読み上げてみるね。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "『インストールありがとうございます』",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "『深く深く感謝申し上げます』",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression.applyDelta(mouthType: .neutral(.medium)))
            ],
            dialogue: "『このアプリは、記号でできた女の子「シンボル・ガール」との対話を楽しむための交流インターフェースです』",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😮.expression)
            ],
            dialogue: "『今後のアップデートでストーリーや他のシンボル・ガールを追加していく予定です』",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🙂.expression)
            ],
            dialogue: "『まずはシンボル・ガール第1号、符美とのコミュニケーションをお楽しみください』",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😲.expression)
            ],
            dialogue: "とのこと。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🥰.expression.applyDelta(emotionalEmissionType: .nothing))
            ],
            dialogue: "私もたくさんあなたと遊びたいな。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.🤗.expression)
            ],
            dialogue: "ホーム画面で私をタップすると、ランダムにおしゃべりできるよ。",
            activeCharacter: .fumi
        ),
        .init(
            characters: [
                .init(character: .fumi, expression: Emoticon.😄.expression)
            ],
            dialogue: "それじゃあ、いっぱいお話ししようね。",
            activeCharacter: .fumi
        )
    ]
}
