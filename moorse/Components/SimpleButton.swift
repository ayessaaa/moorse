//
//  SimpleButton.swift
//  moorse
//
//  Created by yessa on 3/29/26.
//

import SwiftUI

struct SimpleButton: ButtonStyle {
    let colorMain: Color
    let colorShadow: Color
    var cornerRadii: RectangleCornerRadii = .init(
        topLeading: 30.0,
        bottomLeading: 30.0,
        bottomTrailing: 30.0,
        topTrailing: 30.0
    )

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundStyle(.colorBeige100)
            .background(
                UnevenRoundedRectangle(cornerRadii: cornerRadii)
                    .fill(colorMain)
            )
            .shadow(
                color: configuration.isPressed
                    ? Color.colorMaroonOrange200.opacity(0)
                    : colorShadow,
                radius: 0,
                x: 0,
                y: 5
            )
            .overlay(
                UnevenRoundedRectangle(cornerRadii: cornerRadii)
                    .stroke(
                        configuration.isPressed
                            ? colorShadow
                            : Color.white.opacity(0.15),
                        lineWidth: 5
                    )
                    .blur(radius: 0)
                    .offset(y: configuration.isPressed ? 3 : -3)
                    .mask(UnevenRoundedRectangle(cornerRadii: cornerRadii))
            )
            .overlay(
                UnevenRoundedRectangle(cornerRadii: cornerRadii)
                    .stroke(
                        configuration.isPressed
                            ? Color.white.opacity(0.15)
                            : colorShadow,
                        lineWidth: configuration.isPressed ? 5 : 0
                    )
                    .blur(radius: 0)
                    .offset(y: configuration.isPressed ? -2 : 3)
                    .mask(UnevenRoundedRectangle(cornerRadii: cornerRadii))
            )
            .offset(y: configuration.isPressed ? 5 : 0)
    }
}

#Preview("SimpleButton style") {
    Button("Tap me") {}
        .buttonStyle(
            SimpleButton(
                colorMain: .colorOrange200,
                colorShadow: .colorOrangeShadow
            )
        )
}
