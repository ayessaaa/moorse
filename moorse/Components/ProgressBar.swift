//
//  ProgressBar.swift
//  moorse
//
//  Created by yessa on 3/30/26.
//

import SwiftUI

struct ProgressBar: View {
    @State private var progress: Double = 0.0
    let color: Color
    let foregroundColor: Color
    let shadowColor: Color
    let text: String

    var body: some View {
        //        HStack {
        //            Text("Progress")
        //            ProgressView(value: progress)
        //                .padding()
        //                .controlSize(.large)
        //
        //        }

        HStack(alignment: .top, spacing: 10) {
            Text(text)
                .shadow(color: shadowColor,radius: 0, x: 0, y: 3)
            GeometryReader { geometry in

                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 12)

                        .cornerRadius(10)
                        .foregroundStyle(color)
                        .shadow(color: shadowColor, radius: 0, x: 0, y: 4)

                    Rectangle()
                        .frame(
                            width: min(
                                progress * geometry.size.width,
                                geometry.size.width
                            ),
                            height: 12
                        )
                        .foregroundColor(foregroundColor)
                        .cornerRadius(10)

                }
            }.padding(.top, 5)
            Text(String(Int(progress*100))+"%")
                .shadow(color: shadowColor, radius: 0, x: 0, y: 3)
        }
        
        
        .font(Font.custom("LondrinaSolid-Regular", size: 20))
        .foregroundColor(foregroundColor)
        

    }
}

#Preview {
    ProgressBar(color: Color.colorOrange200,foregroundColor: Color.colorBeige100, shadowColor: .colorOrangeShadow,  text: "Progress")
}
