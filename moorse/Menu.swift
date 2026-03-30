//
//  Menu.swift
//  moorse
//
//  Created by yessa on 3/25/26.
//

import SwiftUI
import UIKit

struct CustomButtonStyle: ButtonStyle {
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
                Image("ButtonBG")
                    .resizable()
                    .scaledToFill()
            )
            .clipShape(UnevenRoundedRectangle(cornerRadii: cornerRadii))
            .contentShape(UnevenRoundedRectangle(cornerRadii: cornerRadii))
            .shadow(
                color: configuration.isPressed
                    ? Color.colorMaroonOrange200.opacity(0)
                    : Color.colorMaroon400,
                radius: 0,
                x: 0,
                y: 5
            )
            .overlay(
                UnevenRoundedRectangle(cornerRadii: cornerRadii)
                    .stroke(
                        configuration.isPressed
                            ? Color.colorMaroon400
                            : Color.colorOrange200.opacity(0.25),
                        lineWidth: 5
                    )
                    .blur(radius: 0)
                    .offset(y: configuration.isPressed ? 3 : -2)
                    .mask(UnevenRoundedRectangle(cornerRadii: cornerRadii))
            )
            .overlay(
                UnevenRoundedRectangle(cornerRadii: cornerRadii)
                    .stroke(
                        configuration.isPressed
                            ? Color.colorOrange200.opacity(0.25)
                            : Color.colorMaroon400,
                        lineWidth: configuration.isPressed ? 5 : 0
                    )
                    .blur(radius: 0)
                    .offset(y: configuration.isPressed ? -2 : 3)
                    .mask(UnevenRoundedRectangle(cornerRadii: cornerRadii))
            )
            .offset(y: configuration.isPressed ? 5 : 0)
    }
}

struct Menu: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("LogoTitle")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 30)

                Image("LogoSubtitle")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 30)
                    .padding(.top, -5)
                    .padding(.bottom, 150)

                VStack {
                    NavigationLink(destination: Home()) {
                        HStack {
                            Text("Get Started")
                                .font(
                                    Font.custom(
                                        "LondrinaSolid-Regular",
                                        size: 26
                                    )
                                )
                                .padding(.trailing, 5)
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .shadow(radius: 0, x: 0, y: 5)
                    }
                    .buttonStyle(CustomButtonStyle())
                }


            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("BG")
                    .resizable()
                    .scaledToFill()

            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Menu()
}
