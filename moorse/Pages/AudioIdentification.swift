//
//  AudioIdentification.swift
//  moorse
//
//  Created by yessa on 4/14/26.
//

import CoreHaptics
import SwiftUI

struct AudioIdentification: View {
    @State private var answerArray: [String] = []
    @State private var isLoaded = false
    @State private var wasPlayed = false
    @State private var morseCodeIndex = -1
    @State private var isCorrect: Bool = false

    let colorMain: Color
    let colorMain300: Color
    let colorShadow: Color
    let letter: String
    let morseCode: String

    let choices: [String]
    private let wrongChoices: [String]
    private let rightChoiceIndex: Int
    private let twoChoices: [String]
    private let displayChoices: [String]

    private var engine: CHHapticEngine? = nil

    init(
        colorMain: Color,
        colorMain300: Color,
        colorShadow: Color,
        letter: String,
        morseCode: String,
        choices: [String]
    ) {
        self.colorMain = colorMain
        self.colorMain300 = colorMain300
        self.colorShadow = colorShadow
        self.letter = letter
        self.morseCode = morseCode
        self.choices = choices
        self.wrongChoices = choices.filter { $0 != letter }
        self.rightChoiceIndex = Int.random(in: 0...2)
        self.twoChoices = Array(wrongChoices.shuffled().prefix(2))
        var built = self.twoChoices
        built.insert(letter, at: self.rightChoiceIndex)
        self.displayChoices = built

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
        Text("What letter is this")
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

        VStack(spacing: 50) {
            Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                .bold()
                .foregroundStyle(.colorBeige100)
                .font(.system(size: 56))

            Button(action: {
                playMorseCode(morseCode: morseCode)
                wasPlayed = true
            }) {
                Image(
                    systemName: wasPlayed
                        ? "arrow.counterclockwise" : "play.fill"
                )
                .foregroundStyle(colorMain)
                .font(.system(size: 25, weight: .black))
                .padding()

            }

            .buttonStyle(
                ButtonComponent(
                    colorMain: .colorBeige100,
                    colorShadow: colorShadow,
                    colorInnerShadow: colorMain.opacity(0.25)
                )
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
                        if displayChoices[0] == letter {
                            isCorrect = true
                        }
                    }) {
                        Text(displayChoices[0])
                            .font(
                                Font.custom(
                                    "LondrinaSolid-Regular",
                                    size: 36
                                )
                            )
                            .foregroundColor(.colorBeige100)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .shadow(color: colorShadow, radius: 0, x: 0, y: 4)
                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: colorMain300,
                            colorShadow: colorShadow,
                            colorInnerShadow: colorMain.opacity(0.25)
                        )
                    )

                    Button(action: {
                        if displayChoices[0] == letter {
                            isCorrect = true

                        }
                    }) {
                        Text(displayChoices[1])
                            .font(
                                Font.custom(
                                    "LondrinaSolid-Regular",
                                    size: 36
                                )
                            )
                            .foregroundColor(.colorBeige100)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .shadow(color: colorShadow, radius: 0, x: 0, y: 4)
                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: colorMain300,
                            colorShadow: colorShadow,
                            colorInnerShadow: colorMain.opacity(0.25)
                        )
                    )

                    Button(action: {
                        if displayChoices[0] == letter {
                            isCorrect = true
                        }
                    }) {
                        Text(displayChoices[2])
                            .font(
                                Font.custom(
                                    "LondrinaSolid-Regular",
                                    size: 36
                                )
                            )
                            .foregroundColor(.colorBeige100)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .shadow(color: colorShadow, radius: 0, x: 0, y: 4)
                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: colorMain300,
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
    AudioIdentification(
        colorMain: .colorOrange200,
        colorMain300: .colorOrange300,
        colorShadow: .colorOrangeShadow,
        letter: "E",
        morseCode: "..",
        choices: ["A", "E", "I", "N", "T"]
    )
}
