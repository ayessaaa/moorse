//
//  LetterButton.swift
//  moorse
//
//  Created by yessa on 4/2/26.
//

import SwiftUI

struct LetterButton: View {
    let letter: String
    let morseCode: String
    let colorMain: Color
    let colorShadow: Color
    
    @State private var showingTooltip = false
    
    var body: some View {
        Button(action: {

        }) {
            Text(letter)
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
                    showingTooltip = true
                },
                onRelease: {
                    showingTooltip = false
                }

            )
        )
        .overlay(
            Tooltip(
                showingTooltip: showingTooltip,
                colorShadow: colorShadow,
                morseCode: morseCode
            )
        )
    }
}

#Preview {
    LetterButton(letter: "A", morseCode: ".-", colorMain: .colorOrange200, colorShadow: .colorOrangeShadow)
}
