//
//  TopBarLevel.swift
//  moorse
//
//  Created by yessa on 3/29/26.
//

import SwiftUI

struct TopBarLevel: View {
    let colorMain: Color
    let colorShadow: Color

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                VStack() {
                    ZStack(alignment: .bottom) {

                        HStack(spacing: 20) {
                            HStack {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                            }
                            .foregroundStyle(
                                Color.colorOrangeShadow.opacity(0.5)
                            )
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
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                        .background(
                            Color.clear
                                .background(Color.colorOrange200)
                                .shadow(
                                    color: Color.colorOrangeShadow,
                                    radius: 0,
                                    x: 0,
                                    y: 5
                                )
                        )

                        .overlay(
                            UnevenRoundedRectangle(
                                cornerRadii: .init(
                                    topLeading: 0,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 0
                                )
                            )
                            .stroke(

                                Color.colorMaroon400,
                                lineWidth: 0
                            )
                            .blur(radius: 0)
                            .offset(y: 3)
                            .mask(
                                UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        topLeading: 0,
                                        bottomLeading: 0,
                                        bottomTrailing: 0,
                                        topTrailing: 0
                                    )
                                )
                            )
                        )
                        .offset(y: 0)

                        Spacer()

                        Rectangle()
                            .fill(Color.white.opacity(0.15))
                            .frame(maxWidth: .infinity, maxHeight: 5)
                    }
                }

                ZStack(alignment: .bottom) {

                    HStack(spacing: 5) {
                        Spacer()
                        Button(action: {

                        }) {
                            HStack {
                                Text("Study")
                                    .font(
                                        Font.custom(
                                            "LondrinaSolid-Regular",
                                            size: 20
                                        )
                                    )
                                    .lineLimit(1)
                                Image(
                                    systemName:
                                        "xmark.triangle.circle.square.fill"
                                )
                                .resizable()
                                .frame(width: 16, height: 16)
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .contentShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                            .shadow(radius: 0, x: 0, y: 5)
                        }
                        .frame(minWidth: 100)
                        .buttonStyle(
                            CustomButtonStyle(
                                cornerRadii: .init(
                                    topLeading: 30,
                                    bottomLeading: 30,
                                    bottomTrailing: 8,
                                    topTrailing: 8
                                )
                            )
                        )
                        .compositingGroup()
                        .allowsHitTesting(true)

                        Button(action: {

                        }) {
                            HStack {
                                Text("Play")
                                    .font(
                                        Font.custom(
                                            "LondrinaSolid-Regular",
                                            size: 20
                                        )
                                    )
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .contentShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                            .shadow(radius: 0, x: 0, y: 5)
                        }
                        .frame(minWidth: 85)
                        .buttonStyle(
                            CustomButtonStyle(
                                cornerRadii: .init(
                                    topLeading: 8,
                                    bottomLeading: 8,
                                    bottomTrailing: 30,
                                    topTrailing: 30
                                )
                            )
                        )
                        .compositingGroup()
                        .allowsHitTesting(true)
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                    .background(Color.colorOrange200)

                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 0,
                                bottomLeading: 20,
                                bottomTrailing: 20,
                                topTrailing: 0
                            )
                        )
                    )

                    .background(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 0,
                                bottomLeading: 20,
                                bottomTrailing: 20,
                                topTrailing: 0
                            )
                        )
                        .fill(Color.colorOrange300)
                        .shadow(
                            color: Color.colorOrangeShadow,
                            radius: 0,
                            x: 0,
                            y: 5
                        )
                    )
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(maxWidth: .infinity, maxHeight: 5)
                        .clipShape(
                            UnevenRoundedRectangle(
                                cornerRadii: .init(
                                    topLeading: 0,
                                    bottomLeading: 40,
                                    bottomTrailing: 40,
                                    topTrailing: 0
                                )
                            )
                        )
                        .padding(.horizontal, 10)
                }

            }

        }
    }
}

#Preview {
    TopBarLevel(colorMain: .colorOrange200, colorShadow: .colorOrangeShadow)
}
