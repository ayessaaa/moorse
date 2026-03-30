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
                VStack{
                    
                    TopBarLevel(
                        colorMain: .colorOrange200,
                        colorShadow: .colorOrangeShadow
                    )
                    VStack (spacing: 40) {
                        HStack (spacing: 50){
                            Button(action: {
                                
                            }) {
                                Text("A")
                                    .font(
                                        Font.custom("LondrinaSolid-Regular", size: 42)
                                    )
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 10)
                                
                            }
                            .buttonStyle(
                                SimpleButton(
                                    colorMain: .colorOrange200,
                                    colorShadow: .colorOrangeShadow,
                                    cornerRadii: .init(
                                        topLeading: 20,
                                        bottomLeading: 20,
                                        bottomTrailing: 20,
                                        topTrailing: 20
                                    ),
                                    onPress: {
                                        print("Button was pressed down!")
                                        showingTooltipA = true
                                    },
                                    onRelease: {
                                        print("Button was released!")
                                        showingTooltipA = false
                                    }
                                    
                                )
                            )
                            .overlay(
                                // The custom tooltip view
                                ZStack {
                                    if showingTooltipA {
                                        HStack {
                                            DotSmall()
                                            LineSmall()
                                        }
                                        .shadow(color: Color.colorMaroonOrange200.opacity(0.3),
                                                radius: 0,
                                                x: 0,
                                                y: 3)
                                        .padding()
                                        .foregroundColor(.colorMaroon300)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.colorBeige100)
                                                .shadow(
                                                    color: Color.colorMaroonOrange200.opacity(0.3),
                                                    radius: 0,
                                                    x: 0,
                                                    y: 5
                                                )
                                                
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3),
                                                    lineWidth: 5
                                                )
                                                .blur(radius: 0)
                                                .offset(y: -3)
                                                .mask(RoundedRectangle(cornerRadius: 20))
                                        )
                                        .offset(y: -60)
                                        .fixedSize()
                                    }
                                }
                            )
                            
                            Button(action: {
                                
                            }) {
                                Text("E")
                                    .font(
                                        Font.custom("LondrinaSolid-Regular", size: 42)
                                    )
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 10)
                                
                            }
                            .buttonStyle(
                                SimpleButton(
                                    colorMain: .colorOrange200,
                                    colorShadow: .colorOrangeShadow,
                                    cornerRadii: .init(
                                        topLeading: 20,
                                        bottomLeading: 20,
                                        bottomTrailing: 20,
                                        topTrailing: 20
                                    ),
                                    onPress: {
                                        print("Button was pressed down!")
                                        showingTooltipE = true
                                    },
                                    onRelease: {
                                        print("Button was released!")
                                        showingTooltipE = false
                                    }
                                )
                            )
                            .overlay(
                                // The custom tooltip view
                                ZStack {
                                    if showingTooltipE {
                                        HStack {
                                            DotSmall()
                                                
                                        }
                                        .shadow(color: Color.colorMaroonOrange200.opacity(0.3),
                                                radius: 0,
                                                x: 0,
                                                y: 3)
                                        .padding()
                                        .foregroundColor(.colorMaroon300)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.colorBeige100)
                                                .shadow(
                                                    color: Color.colorMaroonOrange200.opacity(0.3),
                                                    radius: 0,
                                                    x: 0,
                                                    y: 5
                                                )
                                                
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3),
                                                    lineWidth: 5
                                                )
                                                .blur(radius: 0)
                                                .offset(y: -3)
                                                .mask(RoundedRectangle(cornerRadius: 20))
                                        )
                                        .offset(y: -60)
                                        .fixedSize()
                                    }
                                }
                            )
                            
                            Button(action: {
                                
                            }) {
                                Text("I")
                                    .font(
                                        Font.custom("LondrinaSolid-Regular", size: 42)
                                    )
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 10)
                                
                            }
                            .buttonStyle(
                                SimpleButton(
                                    colorMain: .colorOrange200,
                                    colorShadow: .colorOrangeShadow,
                                    cornerRadii: .init(
                                        topLeading: 20,
                                        bottomLeading: 20,
                                        bottomTrailing: 20,
                                        topTrailing: 20
                                    ),onPress: {
                                        print("Button was pressed down!")
                                        showingTooltipI = true
                                    },
                                    onRelease: {
                                        print("Button was released!")
                                        showingTooltipI = false
                                    }
                                )
                            )
                            .overlay(
                                // The custom tooltip view
                                ZStack {
                                    if showingTooltipI {
                                        HStack {
                                            DotSmall()
                                            DotSmall()
                                                
                                        }
                                        .shadow(color: Color.colorMaroonOrange200.opacity(0.3),
                                                radius: 0,
                                                x: 0,
                                                y: 3)
                                        .padding()
                                        .foregroundColor(.colorMaroon300)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.colorBeige100)
                                                .shadow(
                                                    color: Color.colorMaroonOrange200.opacity(0.3),
                                                    radius: 0,
                                                    x: 0,
                                                    y: 5
                                                )
                                                
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3),
                                                    lineWidth: 5
                                                )
                                                .blur(radius: 0)
                                                .offset(y: -3)
                                                .mask(RoundedRectangle(cornerRadius: 20))
                                        )
                                        .offset(y: -60)
                                        .fixedSize()
                                    }
                                }
                            )
                            
                            
                        }
                        
                        
                        HStack (spacing: 50){
                            Button(action: {
                                
                            }) {
                                Text("N")
                                    .font(
                                        Font.custom("LondrinaSolid-Regular", size: 42)
                                    )
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 10)
                                
                            }
                            .buttonStyle(
                                SimpleButton(
                                    colorMain: .colorOrange200,
                                    colorShadow: .colorOrangeShadow,
                                    cornerRadii: .init(
                                        topLeading: 20,
                                        bottomLeading: 20,
                                        bottomTrailing: 20,
                                        topTrailing: 20
                                    ),onPress: {
                                        print("Button was pressed down!")
                                        showingTooltipN = true
                                    },
                                    onRelease: {
                                        print("Button was released!")
                                        showingTooltipN = false
                                    }
                                )
                            )
                            .overlay(
                                // The custom tooltip view
                                ZStack {
                                    if showingTooltipN {
                                        HStack {
                                            LineSmall()
                                            DotSmall()
                                                
                                        }
                                        .shadow(color: Color.colorMaroonOrange200.opacity(0.3),
                                                radius: 0,
                                                x: 0,
                                                y: 3)
                                        .padding()
                                        .foregroundColor(.colorMaroon300)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.colorBeige100)
                                                .shadow(
                                                    color: Color.colorMaroonOrange200.opacity(0.3),
                                                    radius: 0,
                                                    x: 0,
                                                    y: 5
                                                )
                                                
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3),
                                                    lineWidth: 5
                                                )
                                                .blur(radius: 0)
                                                .offset(y: -3)
                                                .mask(RoundedRectangle(cornerRadius: 20))
                                        )
                                        .offset(y: -60)
                                        .fixedSize()
                                    }
                                }
                            )
                            
                            Button(action: {
                                
                            }) {
                                Text("T")
                                    .font(
                                        Font.custom("LondrinaSolid-Regular", size: 42)
                                    )
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 10)
                                
                            }
                            .buttonStyle(
                                SimpleButton(
                                    colorMain: .colorOrange200,
                                    colorShadow: .colorOrangeShadow,
                                    cornerRadii: .init(
                                        topLeading: 20,
                                        bottomLeading: 20,
                                        bottomTrailing: 20,
                                        topTrailing: 20
                                    ),onPress: {
                                        print("Button was pressed down!")
                                        showingTooltipT = true
                                    },
                                    onRelease: {
                                        print("Button was released!")
                                        showingTooltipT = false
                                    }
                                )
                            )
                            .overlay(
                                // The custom tooltip view
                                ZStack {
                                    if showingTooltipT {
                                        HStack {
                                            LineSmall()
                                                
                                        }
                                        .shadow(color: Color.colorMaroonOrange200.opacity(0.3),
                                                radius: 0,
                                                x: 0,
                                                y: 3)
                                        .padding()
                                        .foregroundColor(.colorMaroon300)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.colorBeige100)
                                                .shadow(
                                                    color: Color.colorMaroonOrange200.opacity(0.3),
                                                    radius: 0,
                                                    x: 0,
                                                    y: 5
                                                )
                                                
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3),
                                                    lineWidth: 5
                                                )
                                                .blur(radius: 0)
                                                .offset(y: -3)
                                                .mask(RoundedRectangle(cornerRadius: 20))
                                        )
                                        .offset(y: -60)
                                        .fixedSize()
                                    }
                                }
                            )
                        }
                    }
                    .padding(.vertical, 20)
                }
                .frame(maxWidth: .infinity)
                .background(Image("Level1BG")
                    .resizable()
                    .scaledToFill())
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .background(.colorBeige100)
    }
}

#Preview {
    Home()
}
