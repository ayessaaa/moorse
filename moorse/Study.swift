//
//  Study.swift
//  moorse
//
//  Created by yessa on 4/4/26.
//

import SwiftUI

struct Study: View {
    @State private var progress = 50.0
    @State private var contentSize: CGSize? = nil  // "proxy" size

    var body: some View {
        VStack(spacing: 4) {
            TitleSection()

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
                .frame(width: .infinity, height: 75)
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
                        .foregroundStyle(Color.colorBeige100)
                    LineLarge()
                        .foregroundStyle(Color.colorBeige100.opacity(0.6))
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

                HStack (spacing: 20){

                    Button(action: {

                    }) {
                        Image(systemName: "arrow.trianglehead.counterclockwise")
                            .font(.system(size: 30, weight: .black))
                            .padding(.horizontal, 35)
                            .padding(.vertical, 15)
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

                    }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 36, weight: .heavy))
                            .padding(.horizontal, 35)
                            .padding(.vertical, 15)
                            .foregroundStyle(.colorOrange200)

                    }
                    .buttonStyle(
                        ButtonComponent(
                            colorMain: .colorBeige100,
                            colorShadow: .colorOrangeShadow,
                            colorInnerShadow: .colorOrange200.opacity(0.25)
                        )
                    )
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
