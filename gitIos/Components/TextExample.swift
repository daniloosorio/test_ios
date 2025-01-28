//
//  TextExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 13/01/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
            .font(.headline)
        Text("hil").font(.system(size: 50, weight: .light, design: .monospaced))
            .italic().bold().underline().foregroundColor(.blue).background(.red)
        Text("holi holi como estas  blablabla")
            .frame(width: 100)
            .lineLimit(2)
            .lineSpacing(30)
        
    }
}

#Preview {
    TextExample()
}
