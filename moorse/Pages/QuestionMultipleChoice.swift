//
//  QuestionMultipleChoice.swift
//  moorse
//
//  Created by yessa on 4/5/26.
//

import SwiftUI

struct QuestionMultipleChoice: View {
    @State private var isLoaded = false
    @State private var wasPlayed = false
    @State private var morseCodeIndex = -1

    let colorMain: Color
    let colorMain300: Color
    let colorShadow: Color
    let letter: String
    let morseCode: String

    var body: some View {
        Spacer()
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

            //            HStack(spacing: 20) {
            //                Image(systemName: "speaker.wave.1.fill")
            //                    .font(.system(size: 36, weight: .heavy))
            //                    .padding(.trailing, 5)
            //                    .foregroundStyle(Color.colorBeige100.opacity(0.6))
            //
            //            }
            //
            //            .shadow(color: colorShadow, radius: 0, x: 0, y: 6)
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

            HStack(spacing: 20) {

                Button(action: {
                    //                    playMorseCode(morseCode: morseCode)
                    wasPlayed = true
                    //                    Task { await morseCodeAnimation(morseCode: morseCode) }
                }) {
                    HStack (spacing: 10){

                        ForEach(Array(morseCode.enumerated()), id: \.offset) {
                            index,
                            char in
                            if char == "." {
                                DotLarge()
                                    .foregroundStyle(
                                        Color.colorBeige100
                                    )
                            } else {

                                LineLarge()
                                    .foregroundStyle(
                                        Color.colorBeige100
                                    )
                            }

                        }
                    }
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

                }) {
                    //                    Image(systemName: "checkmark")
                    //                        .font(.system(size: 36, weight: .heavy))
                    //                        .frame(width: 120, height: 70)
                    //                        //                            .padding(.horizontal, 35)
                    //                        //                            .padding(.vertical, 15)
                    //                        .foregroundStyle(colorMain)
                    HStack (spacing: 10){

                        ForEach(Array(morseCode.enumerated()), id: \.offset) {
                            index,
                            char in
                            if char == "." {
                                DotLarge()
                                    .foregroundStyle(
                                        Color.colorBeige100
                                    )
                            } else {

                                LineLarge()
                                    .foregroundStyle(
                                        Color.colorBeige100
                                    )
                            }

                        }
                    }
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
    QuestionMultipleChoice(
        colorMain: .colorOrange200,
        colorMain300: .colorOrange300,
        colorShadow: .colorOrangeShadow,
        letter: "E",
        morseCode: "."
    )
}
