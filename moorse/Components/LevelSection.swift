//
//  LevelSection.swift
//  moorse
//
//  Created by yessa on 4/2/26.
//

import SwiftUI

struct LevelSection: View {
    var numberOfLetters: Int = 5

    let letter1: String
    let letter2: String
    let letter3: String
    var letter4: String = ""
    var letter5: String = ""
    let morse1: String
    let morse2: String
    let morse3: String
    var morse4: String = ""
    var morse5: String = ""

    let colorMain: Color
    let colorShadow: Color

    let bgImg: String

    var body: some View {

        ZStack(alignment: .top) {

            Image(bgImg)
                .resizable()
                .scaledToFill()

            VStack(spacing: 30) {

                TopBarLevel(
                    colorMain: colorMain,
                    colorShadow: colorShadow
                )
                VStack(spacing: 40) {
                    HStack(spacing: 50) {

                        LetterButton(
                            letter: letter1,
                            morseCode: morse1,
                            colorMain: colorMain,
                            colorShadow: colorShadow
                        )

                        LetterButton(
                            letter: letter2,
                            morseCode: morse2,
                            colorMain: colorMain,
                            colorShadow: colorShadow
                        )

                        LetterButton(
                            letter: letter3,
                            morseCode: morse3,
                            colorMain: colorMain,
                            colorShadow: colorShadow
                        )
                    }
                    if numberOfLetters > 3 {
                        HStack(spacing: 50) {

                            LetterButton(
                                letter: letter4,
                                morseCode: morse4,
                                colorMain: colorMain,
                                colorShadow: colorShadow
                            )

                            LetterButton(
                                letter: letter5,
                                morseCode: morse5,
                                colorMain: colorMain,
                                colorShadow: colorShadow
                            )

                        }
                    }

                }
                //                        .padding(.vertical, 20)
                ProgressBar(
                    color: colorMain,
                    foregroundColor: .colorBeige100,
                    shadowColor: colorShadow,
                    text: "Progress"
                )
                .padding(.horizontal, 50)
            }
            .frame(maxWidth: .infinity)
            //                    .offset(x: -5)
        }

    }

}

#Preview {
    LevelSection(
        letter1: "A",
        letter2: "E",
        letter3: "I",
        letter4: "N",
        letter5: "T",
        morse1: ".-",
        morse2: ".",
        morse3: "..",
        morse4: "-.",
        morse5: "-",
        colorMain: .colorOrange200,
        colorShadow: .colorOrangeShadow,
        bgImg: "Level1BG"
    )
}
