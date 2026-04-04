//
//  Study.swift
//  moorse
//
//  Created by yessa on 4/4/26.
//

import AudioToolbox
import CoreHaptics
import SwiftUI

struct Study: View {
    @State private var isLoaded = false
    @State private var wasPlayed = false
    @State private var progress = 50.0
    @State private var contentSize: CGSize? = nil  // "proxy" size

    @State private var morseCodeIndex = -1

    var engine: CHHapticEngine?

    init() {
        prepareHaptics()
    }

    mutating func prepareHaptics() {
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

    @MainActor func morseCodeAnimation(morseCode: String) async {
        let dotDuration = 0.2
        let dashDuration = 0.6
        let gap = 0.2

        var durationArray: [Double] = []

        for char in morseCode {
            switch char {
            case ".":
                durationArray.append(dotDuration)
            case "-":
                durationArray.append(dashDuration)
            default:
                break
            }
        }

        for (index, code) in morseCode.enumerated() {
            morseCodeIndex = index + 1
            if code == "." {
                do {
                    try await Task.sleep(for: .seconds(dotDuration))
                } catch {
                    return
                }
            } else if code == "-" {
                do {
                    try await Task.sleep(for: .seconds(dashDuration))
                } catch {
                    return
                }
            }
            morseCodeIndex = 0
            do {
                try await Task.sleep(for: .seconds(gap))
            } catch {
                return
            }
        }
        morseCodeIndex = -1

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
        VStack(spacing: 4) {
            //            TitleSection(showTitle: false)

            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    HStack(alignment: .top) {
                        Text("Study: ")
                            .font(
                                Font.custom(
                                    "LondrinaSolid-Regular",
                                    size: 24
                                )
                            )
                            .padding(.top, -3)
                            .foregroundStyle(Color.colorBeige100)
                            .shadow(
                                color: Color.colorOrangeShadow,
                                radius: 0,
                                x: 0,
                                y: 3
                            )
                        Text("Section 1")
                            .font(
                                Font.custom(
                                    "LondrinaSolid-Regular",
                                    size: 20
                                )
                            )
                            .foregroundStyle(Color.colorBeige100.opacity(0.8))
                            .shadow(
                                color: Color.colorOrangeShadow,
                                radius: 0,
                                x: 0,
                                y: 3
                            )
                        ProgressBar(
                            color: Color.colorBeige100.opacity(0.6),
                            foregroundColor: Color.colorBeige100,
                            shadowColor: .colorOrangeShadow,
                            text: ""
                        )
                    }

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

                }
                .padding()
                .frame(height: 75)
                .background(.colorOrange200)
                //            .shadow(radius: 0, x: 0, y: 3)

                Rectangle()
                    .fill(Color.white.opacity(0.15))
                    .frame(maxWidth: .infinity, maxHeight: 5)

            }
            .background(
                Rectangle()
                    .fill(Color.colorOrange300)
                    .shadow(
                        color: .colorOrangeShadow,
                        radius: 0,
                        x: 0,
                        y: 5
                    )
            )

            Spacer()
            VStack(spacing: 30) {
                Text("A")
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
                            .fill(.colorOrange200)
                            .shadow(
                                color: .colorOrangeShadow,
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
                    Image(systemName: "speaker.wave.1.fill")
                        .font(.system(size: 36, weight: .heavy))
                        .padding(.trailing, 5)
                        .foregroundStyle(Color.colorBeige100.opacity(0.6))

                    DotLarge()
                        .foregroundStyle(morseCodeIndex == 1 ? Color.colorBeige100 : Color.colorBeige100.opacity(0.6))
                    LineLarge()
                        .foregroundStyle(morseCodeIndex == 2 ? Color.colorBeige100 : Color.colorBeige100.opacity(0.6))
                }

                .shadow(color: .colorOrangeShadow, radius: 0, x: 0, y: 6)
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
                .background(.colorOrange200)

                Rectangle()
                    .fill(Color.white.opacity(0.15))
                    .frame(maxWidth: .infinity, maxHeight: 5)

                HStack(spacing: 20) {

                    Button(action: {
                        playMorseCode(morseCode: ".-")
                        wasPlayed = true
                        Task { await morseCodeAnimation(morseCode: ".-") }
                    }) {
                        Image(
                            systemName: wasPlayed
                                ? "arrow.trianglehead.counterclockwise"
                                : "play.fill"
                        )
                        .font(.system(size: 30, weight: .black))
                        .frame(width: 120, height: 70)
                        .foregroundStyle(.colorBeige100)

                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: .colorOrange300,
                            colorShadow: .colorOrangeShadow,
                            colorInnerShadow: .colorOrange200.opacity(0.25)
                        )
                    )

                    Button(action: {
                        AudioServicesPlaySystemSound(1520)

                    }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 36, weight: .heavy))
                            .frame(width: 120, height: 70)
                            //                            .padding(.horizontal, 35)
                            //                            .padding(.vertical, 15)
                            .foregroundStyle(.colorOrange200)

                    }

                    .buttonStyle(
                        ButtonComponent(
                            colorMain: .colorBeige100,
                            colorShadow: .colorOrangeShadow,
                            colorInnerShadow: .colorOrange200.opacity(0.25)
                        )
                    )
                    .frame(width: 100, height: 100)
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
                    .fill(Color.colorOrange300)
                    .shadow(
                        color: .colorOrangeShadow,
                        radius: 0,
                        x: 0,
                        y: -5
                    )
            )

        }

        .background(
            Image("Level1FullBG")
                .resizable()
                .scaledToFill()
        )
    }

}

#Preview {
    Study()
}

