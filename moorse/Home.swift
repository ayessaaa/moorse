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
        NavigationView() {
            VStack(spacing: 5) {
                TitleSection()
                
                ZStack {
                    VStack (spacing:0){
                        Color.colorOrange200
                        Color.colorPurple200
                    }
                    .ignoresSafeArea()
                    
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
                            
                            // LEVEL 5
                            LevelSection(
                                numberOfLetters: 3,
                                letter1: "P",
                                letter2: "Q",
                                letter3: "V",
                                morse1: ".--.",
                                morse2: "--.-",
                                morse3: "...-",
                                colorMain: .colorRed200,
                                colorShadow: .colorRedShadow,
                                bgImg: "Level5BG"
                            )
                            
                            // LEVEL 6
                            LevelSection(
                                numberOfLetters: 3,
                                letter1: "X",
                                letter2: "Y",
                                letter3: "Z",
                                morse1: "-..-",
                                morse2: "-.--",
                                morse3: "--..",
                                colorMain: .colorPurple200,
                                colorShadow: .colorPurpleShadow,
                                bgImg: "Level6BG"
                            )
                            
                        }
                        
                    }
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .background(.colorBeige100)
    }
}

#Preview {
    Home()
}
