//
//  ContentView.swift
//  moorse
//
//  Created by yessa on 3/22/26.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
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

            Button(action: {

            }) {
                HStack {
                    Text("Get Started")
                        .padding(.trailing, 5)
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 5)
                .shadow(radius: 0, x: 0, y: 5)

            }

            .font(Font.custom("LondrinaSolid-Regular", size: 26))
            .font(.title)
            .foregroundStyle(.colorBeige100)
            //                .background(.colorMaroon300)
            .background(
                Image("ButtonBG")
                    .resizable()
                    .scaledToFill()
            )
            .clipShape(Capsule())
            .shadow(color: .colorMaroon400, radius: 0, x: 0, y: 5)
            .buttonStyle(.bordered)

            .overlay(
                Capsule()
                    .stroke(Color.colorOrange200.opacity(0.25), lineWidth: 4)
                    .blur(radius: 0)
                    .offset(y: -2)
                    .mask(Capsule())
            )
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.colorBeige100)
        .ignoresSafeArea()
    }

}

#Preview {
    ContentView()
}
