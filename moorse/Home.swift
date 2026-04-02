//
//  Home.swift
//  moorse
//
//  Created by yessa on 3/26/26.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct Home: View {
    @State private var showingTooltipA = false
    @State private var showingTooltipE = false
    @State private var showingTooltipI = false
    @State private var showingTooltipN = false
    @State private var showingTooltipT = false

    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text("Moorse")
                    .foregroundStyle(Color.colorMaroon300)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(
                ZStack(alignment: .bottom) {
                    // Base fill
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.colorBeige100)
                        .shadow(
                            color: Color.colorMaroonOrange200.opacity(0.3),
                            radius: 0,
                            x: 0,
                            y: 5
                        )

                    Spacer()

                    // Inner shadow
                    Rectangle()
                        .fill(Color.white.opacity(0.5))
                        .frame(maxWidth: .infinity, maxHeight: 5)

                }
            )
            .background(Color.colorBeige100)
            .font(Font.custom("LondrinaSolid-Regular", size: 36))

            ScrollView {

                VStack(spacing: 0) {
                    
                    // LEVEL 1
                    LevelSection(
                        letter1: "A",
                        letter2: "E",
                        letter3: "I",
                        letter4: "N",
                        letter5: "T",
                        morse1: ".-",
                        morse2: ".",
                        morse3: "..",
                        morse4: "-.",
                        morse5: "-",
                        colorMain: .colorOrange200,
                        colorShadow: .colorOrangeShadow,
                        bgImg: "Level1BG"
                    )
                    
                    // LEVEL 2
                    LevelSection(
                        letter1: "G",
                        letter2: "K",
                        letter3: "L",
                        letter4: "O",
                        letter5: "S",
                        morse1: "--.",
                        morse2: "-.-",
                        morse3: ".-..",
                        morse4: "---",
                        morse5: "...",
                        colorMain: .colorGreen200,
                        colorShadow: .colorGreenShadow,
                        bgImg: "Level2BG"
                    )
                    
                    // LEVEL 3
                    LevelSection(
                        letter1: "D",
                        letter2: "H",
                        letter3: "R",
                        letter4: "U",
                        letter5: "W",
                        morse1: "-..",
                        morse2: "....",
                        morse3: ".-.",
                        morse4: "..-",
                        morse5: ".--",
                        colorMain: .colorBlue200,
                        colorShadow: .colorBlueShadow,
                        bgImg: "Level3BG"
                    )
                    
                    // LEVEL 4
                    LevelSection(
                        letter1: "B",
                        letter2: "C",
                        letter3: "F",
                        letter4: "J",
                        letter5: "L",
                        morse1: "-...",
                        morse2: "-.-.",
                        morse3: "..-.",
                        morse4: ".---",
                        morse5: ".-..",
                        colorMain: .colorPink200,
                        colorShadow: .colorPinkShadow,
                        bgImg: "Level4BG"
                    )


                }

            }
            .background(.colorOrange200)

        }
        .navigationBarBackButtonHidden(true)
        .background(.colorBeige100)
    }
}

#Preview {
    Home()
}
