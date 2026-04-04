//
//  TitleSection.swift
//  moorse
//
//  Created by yessa on 4/4/26.
//

import SwiftUI

struct TitleSection: View {
    var showTitle: Bool = true
    var body: some View {

        HStack {
            if showTitle {

                Text("Moorse")
                    .foregroundStyle(Color.colorMaroon300)
                    .padding(5)
            }
        }
        .padding(5)
        .frame(maxWidth: .infinity)
        .background(
            ZStack(alignment: .bottom) {
                // Base fill
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.colorBeige100)
                    .shadow(
                        color: Color.colorBeigeShadow,
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
    }

}

#Preview {
    TitleSection(showTitle: false)
}
