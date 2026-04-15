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

    @State private var progress = 50.0
    @State private var contentSize: CGSize? = nil  // "proxy" size

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

            AudioIdentification(
                colorMain: .colorOrange200,
                colorMain300: .colorOrange300,
                colorShadow: .colorOrangeShadow,
                letter: "E",
                morseCode: ".", 
                choices: ["A", "E", "I", "N", "T"]
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
