//
//  Line.swift
//  moorse
//
//  Created by yessa on 3/30/26.
//

import SwiftUI

struct LineSmall: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 30, height: 8)
    }
}

struct LineLarge: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 60, height: 20)
    }
}

#Preview {
    LineSmall()
}
