//
//  LevelSection.swift
//  moorse
//
//  Created by yessa on 4/2/26.
//

import SwiftUI

struct LevelSection: View {
    let letter1: String
    let letter2: String
    let letter3: String
    let letter4: String
    let letter5: String
    let morse1: String
    let morse2: String
    let morse3: String
    let morse4: String
    let morse5: String

    let colorMain: Color
    let colorShadow: Color

    let bgImg: String

    @State private var showingTooltip1 = false
    @State private var showingTooltip2 = false
    @State private var showingTooltip3 = false
    @State private var showingTooltip4 = false
    @State private var showingTooltip5 = false

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
                        Button(action: {

                        }) {
                            Text(letter1)
                                .font(
                                    Font.custom(
                                        "LondrinaSolid-Regular",
                                        size: 42
                                    )
                                )
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)

                        }
                        .buttonStyle(
                            SimpleButton(
                                colorMain: colorMain,
                                colorShadow: colorShadow,
                                cornerRadii: .init(
                                    topLeading: 20,
                                    bottomLeading: 20,
                                    bottomTrailing: 20,
                                    topTrailing: 20
                                ),
                                onPress: {
                                    showingTooltip1 = true
                                },
                                onRelease: {
                                    showingTooltip1 = false
                                }

                            )
                        )
                        .overlay(
                            Tooltip(
                                showingTooltip: showingTooltip1,
                                morseCode: morse1
                            )
                        )

                        Button(action: {

                        }) {
                            Text(letter2)
                                .font(
                                    Font.custom(
                                        "LondrinaSolid-Regular",
                                        size: 42
                                    )
                                )
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)

                        }
                        .buttonStyle(
                            SimpleButton(
                                colorMain: colorMain,
                                colorShadow: colorShadow,
                                cornerRadii: .init(
                                    topLeading: 20,
                                    bottomLeading: 20,
                                    bottomTrailing: 20,
                                    topTrailing: 20
                                ),
                                onPress: {
                                    showingTooltip2 = true
                                },
                                onRelease: {
                                    showingTooltip2 = false
                                }
                            )
                        )
                        .overlay(
                            Tooltip(
                                showingTooltip: showingTooltip2,
                                morseCode: morse2
                            )
                        )

                        Button(action: {

                        }) {
                            Text(letter3)
                                .font(
                                    Font.custom(
                                        "LondrinaSolid-Regular",
                                        size: 42
                                    )
                                )
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)

                        }
                        .buttonStyle(
                            SimpleButton(
                                colorMain: colorMain,
                                colorShadow: colorShadow,
                                cornerRadii: .init(
                                    topLeading: 20,
                                    bottomLeading: 20,
                                    bottomTrailing: 20,
                                    topTrailing: 20
                                ),
                                onPress: {
                                    showingTooltip3 = true
                                },
                                onRelease: {
                                    showingTooltip3 = false
                                }
                            )
                        )
                        .overlay(
                            Tooltip(
                                showingTooltip: showingTooltip3,
                                morseCode: morse3
                            )
                        )

                    }

                    HStack(spacing: 50) {
                        Button(action: {

                        }) {
                            Text(letter4)
                                .font(
                                    Font.custom(
                                        "LondrinaSolid-Regular",
                                        size: 42
                                    )
                                )
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)

                        }
                        .buttonStyle(
                            SimpleButton(
                                colorMain: colorMain,
                                colorShadow: colorShadow,
                                cornerRadii: .init(
                                    topLeading: 20,
                                    bottomLeading: 20,
                                    bottomTrailing: 20,
                                    topTrailing: 20
                                ),
                                onPress: {
                                    showingTooltip4 = true
                                },
                                onRelease: {
                                    showingTooltip4 = false
                                }
                            )
                        )
                        .overlay(
                            Tooltip(
                                showingTooltip: showingTooltip4,
                                morseCode: morse4
                            )
                        )

                        Button(action: {

                        }) {
                            Text(letter5)
                                .font(
                                    Font.custom(
                                        "LondrinaSolid-Regular",
                                        size: 42
                                    )
                                )
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)

                        }
                        .buttonStyle(
                            SimpleButton(
                                colorMain: colorMain,
                                colorShadow: colorShadow,
                                cornerRadii: .init(
                                    topLeading: 20,
                                    bottomLeading: 20,
                                    bottomTrailing: 20,
                                    topTrailing: 20
                                ),
                                onPress: {
                                    showingTooltip5 = true
                                },
                                onRelease: {
                                    showingTooltip5 = false
                                }
                            )
                        )
                        .overlay(
                            Tooltip(
                                showingTooltip: showingTooltip5,
                                morseCode: morse5
                            )
                        )
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
