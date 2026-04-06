//
//  Identification.swift
//  moorse
//
//  Created by yessa on 4/6/26.
//

import CoreHaptics
import SwiftUI

struct Identification: View {
    @State private var answerArray: [String] = []
    @State private var isLoaded = false
    @State private var wasPlayed = false
    @State private var morseCodeIndex = -1

    let colorMain: Color
    let colorMain300: Color
    let colorShadow: Color
    let letter: String
    let morseCode: String

    private var engine: CHHapticEngine?

    init(
        colorMain: Color,
        colorMain300: Color,
        colorShadow: Color,
        letter: String,
        morseCode: String
    ) {
        self.colorMain = colorMain
        self.colorMain300 = colorMain300
        self.colorShadow = colorShadow
        self.letter = letter
        self.morseCode = morseCode
        prepareHaptics()
    }

    private mutating func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Haptic Engine Error: \(error.localizedDescription)")
        }
    }

    func playMorseCode(morseCode: String) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }

        let dotDuration = 0.2
        let dashDuration = 0.6
        let gap = 0.2

        var events = [CHHapticEvent]()
        var currentTime: TimeInterval = 0

        // Helper to add events
        func addPulse(duration: TimeInterval) {
            let event = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [],
                relativeTime: currentTime,
                duration: duration
            )
            events.append(event)
            currentTime += (duration + gap)
        }

        for char in morseCode {
            switch char {
            case ".":
                addPulse(duration: dotDuration)
            case "-":
                addPulse(duration: dashDuration)
            default:
                break
            }
        }

        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }

    var body: some View {
        Spacer()
        Text("What is the morse code for")
            .font(
                Font.custom(
                    "LondrinaSolid-Regular",
                    size: 30
                )
            )
            .foregroundColor(.colorBeige100)
            .padding(.vertical, 10)
            .padding(.horizontal, 40)
            .shadow(color: colorShadow, radius: 0, x: 0, y: 4)

        VStack(spacing: 30) {
            Text(letter)
                .font(
                    Font.custom(
                        "LondrinaSolid-Regular",
                        size: 80
                    )
                )
                .foregroundColor(.colorBeige100)
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colorMain)
                        .shadow(
                            color: colorShadow,
                            radius: 0,
                            x: 0,
                            y: 8
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            Color.white.opacity(0.15),
                            lineWidth: 8
                        )
                        .padding(.horizontal, -5)
                        .blur(radius: 0)
                        .offset(y: -4)
                        .mask(RoundedRectangle(cornerRadius: 20))
                )

            HStack(spacing: 20) {

                ForEach(answerArray, id: \.self) { code in
                    if code == "." {
                        DotLarge()
                    } else if code == "-" {
                        LineLarge()
                    }
                }

            }
            .animation(.spring(), value: answerArray)
            .foregroundStyle(colorMain)
            .frame(minWidth: 100, minHeight: 20)
            .padding()
            .padding(.horizontal, 20)

            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.colorBeige100)
                    .shadow(
                        color: .colorBeigeShadow,
                        radius: 0,
                        x: 0,
                        y: 8
                    )
                    .animation(.spring(), value: answerArray)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        Color.white.opacity(0.15),
                        lineWidth: 8
                    )
                    .padding(.horizontal, -5)
                    .blur(radius: 0)
                    .offset(y: -4)
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .animation(.spring(), value: answerArray)
            )

        }

        Spacer()

        ZStack(alignment: .top) {

            VStack(spacing: 10, ) {
                Line()
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round,
                            dash: [20, 25]
                        )
                    )
                    .foregroundStyle(.colorBeige100.opacity(0.25))
                    .frame(height: 1)
                    .frame(minWidth: 1)
                    .padding(.top, -5)

                Spacer()

            }
            .padding()
            .padding(.top, 10)
            .frame(width: .infinity, height: 300)
            .background(colorMain)

            Rectangle()
                .fill(Color.white.opacity(0.15))
                .frame(maxWidth: .infinity, maxHeight: 5)

            VStack(spacing: 20) {
                HStack(spacing: 10) {

                    Button(action: {
                        answerArray.append(".")
                        playMorseCode(morseCode: ".")
                    }) {
                        DotLarge()
                            .foregroundStyle(
                                Color.colorBeige100
                            )
                            .frame(minWidth: 120)
                            .frame(minHeight: 70)

                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: colorMain300,
                            colorShadow: colorShadow,
                            colorInnerShadow: colorMain.opacity(0.25)
                        )
                    )

                    Button(action: {
                        answerArray.append("-")
                        playMorseCode(morseCode: "-")
                    }) {
                        LineLarge()
                            .foregroundStyle(
                                Color.colorBeige100
                            )

                            .frame(minWidth: 120)
                            .frame(minHeight: 70)

                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: colorMain300,
                            colorShadow: colorShadow,
                            colorInnerShadow: colorMain.opacity(0.25)
                        )
                    )

                }
                HStack(spacing: 10) {

                    Button(action: {
                        answerArray.popLast()
                    }) {
                        Image(systemName: "delete.left.fill")
                            .font(.system(size: 36, weight: .black))
                            .frame(minWidth: 80, minHeight: 70)
                            //                            .padding(.horizontal, 35)
                            //                            .padding(.vertical, 15)
                            .foregroundStyle(colorMain)

                    }

                    .buttonStyle(
                        ButtonComponent(
                            colorMain: .colorBeige100,
                            colorShadow: colorShadow,
                            colorInnerShadow: colorMain.opacity(0.25)
                        )
                    )

                    Button(action: {

                    }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 36, weight: .black))
                            .frame(minWidth: 80, minHeight: 70)
                            //                            .padding(.horizontal, 35)
                            //                            .padding(.vertical, 15)
                            .foregroundStyle(colorMain)

                    }

                    .buttonStyle(
                        ButtonComponent(
                            colorMain: .colorBeige100,
                            colorShadow: colorShadow,
                            colorInnerShadow: colorMain.opacity(0.25)
                        )
                    )
                }

            }
            .opacity(isLoaded ? 1 : 0)
            .offset(y: isLoaded ? 0 : 20)
            .onAppear {

                withAnimation(.easeIn(duration: 0.4)) {
                    isLoaded = true
                }
            }
            .padding(.top, 50)
        }

        .background(
            Rectangle()
                .fill(colorMain300)
                .shadow(
                    color: colorShadow,
                    radius: 0,
                    x: 0,
                    y: -5
                )
        )

    }
}

#Preview {
    Identification(
        colorMain: .colorOrange200,
        colorMain300: .colorOrange300,
        colorShadow: .colorOrangeShadow,
        letter: "E",
        morseCode: ".."
    )
}
