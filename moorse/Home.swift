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
    var body: some View {
        VStack {
            HStack {
                Text("Moorse")
                    .foregroundStyle(Color.colorMaroon300)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(
                ZStack (alignment: .bottom) {
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
                VStack {
                    HStack {
                        HStack{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round,  dash: [20, 15]))
                            .foregroundStyle(.colorBeige100)
                            .frame(height:1)
                            .frame(minWidth:1)
                        
                        
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                HStack {
                                    Text("Study")
                                        .font(Font.custom("LondrinaSolid-Regular", size: 20))
                                        .lineLimit(1)
                                    Image(systemName: "xmark.triangle.circle.square.fill")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .contentShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 0, x: 0, y: 5)
                            }
                            .buttonStyle(CustomButtonStyle(cornerRadii: .init(
                                topLeading: 30,
                                bottomLeading: 30,
                                bottomTrailing: 8,
                                topTrailing: 8
                            )))
                            .compositingGroup()
                            .allowsHitTesting(true)
                            
                            Button(action: {

                            }) {
                                HStack {
                                    Text("Play")
                                        .font(Font.custom("LondrinaSolid-Regular", size: 20))
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .contentShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 0, x: 0, y: 5)
                            }
                            .buttonStyle(CustomButtonStyle(cornerRadii: .init(
                                topLeading: 8,
                                bottomLeading: 8,
                                bottomTrailing: 30,
                                topTrailing: 30
                            )))
                            .compositingGroup()
                            .allowsHitTesting(true)
                        }
                        .padding(.vertical, 20)
                        .background(Color.colorOrange300)
                        
                        
                        
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Home()
}
