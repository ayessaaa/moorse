//
//  Tooltip.swift
//  moorse
//
//  Created by yessa on 3/29/26.
//

import SwiftUI

struct PressAndReleaseButtonStyle: ButtonStyle {
    let colorMain: Color
    let colorShadow: Color
    var cornerRadii: RectangleCornerRadii = .init(
        topLeading: 30.0,
        bottomLeading: 30.0,
        bottomTrailing: 30.0,
        topTrailing: 30.0
    )
    var onPress: () -> Void
    var onRelease: () -> Void

    func makeBody(configuration: Configuration) -> some View {
        // The configuration.isPressed state tells you if the button is currently being held down.
        // You can use this state to trigger actions or change the UI appearance.
        configuration.label
            .onChange(of: configuration.isPressed) { oldValue, newValue in
                // Fire only on state transitions
                if oldValue == false && newValue == true {
                    onPress()
                } else if oldValue == true && newValue == false {
                    onRelease()
                }
            }
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

struct Tooltip1: View {
    @State private var offset = CGSize.zero
    @State private var showingTooltip = false
    let buttonTitle: String
    let tooltipText: String

    var body: some View {
        Button(action: {

        }) {
            Text(buttonTitle)
                .padding()
                .foregroundColor(.white)
        }
        .buttonStyle(
            PressAndReleaseButtonStyle(
                colorMain: .colorOrange200,
                colorShadow: .colorOrangeShadow,
                onPress: {
                    print("Button was pressed down!")
                    showingTooltip = true
                },
                onRelease: {
                    print("Button was released!")
                    showingTooltip = false
                }
            )
        )

        .overlay(
            // The custom tooltip view
            ZStack {
                if showingTooltip {
                    HStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 8, height: 8)
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 30, height: 8)
                            
                    }
                    .shadow(color: Color.colorMaroonOrange200.opacity(0.3),
                            radius: 0,
                            x: 0,
                            y: 3)
                    .padding()
                    .foregroundColor(.colorMaroon300)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.colorBeige100)
                            .shadow(
                                color: Color.colorMaroonOrange200.opacity(0.3),
                                radius: 0,
                                x: 0,
                                y: 5
                            )
                            
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.3),
                                lineWidth: 5
                            )
                            .blur(radius: 0)
                            .offset(y: -3)
                            .mask(RoundedRectangle(cornerRadius: 20))
                    )
                    .offset(y: -70)
                    .fixedSize()
                }
            }
        )

    }
}

struct Tooltip: View {
    let showingTooltip: Bool
    let colorShadow: Color
    var morseCode: String = "."
    var body: some View {
        ZStack {
            if showingTooltip {
                HStack {
                    ForEach(Array(morseCode), id: \.self) { character in
                        
                        if character == "." {
                            DotSmall()
                        } else {
                            LineSmall()
                        }
                    }
                }
                .shadow(color: Color.colorMaroon300.opacity(0.3),
                        radius: 0,
                        x: 0,
                        y: 3)
                .padding()
                .foregroundColor(.colorMaroon300)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.colorBeige100)
                        .shadow(
                            color: colorShadow.opacity(0.5),
                            radius: 0,
                            x: 0,
                            y: 5
                        )
                    
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3),
                                lineWidth: 5
                               )
                        .blur(radius: 0)
                        .offset(y: -3)
                        .mask(RoundedRectangle(cornerRadius: 20))
                )
                .offset(y: -60)
                .fixedSize()
            }
        }}}

#Preview {
    Tooltip1(buttonTitle: "Press", tooltipText: "presssdsd me")
}

