//
//  Dot.swift
//  moorse
//
//  Created by yessa on 3/30/26.
//

import SwiftUI

struct DotSmall: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 8, height: 8)
    }
}

#Preview {
    DotSmall()
}
