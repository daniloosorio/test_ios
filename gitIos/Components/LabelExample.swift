//
//  LabelExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 14/01/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("holi", image: "icon")
        Label("jajaj",systemImage: "sun.min.fill")
        Label(
            title: {Text("foto")},
            icon: {
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
            }
        )
    }
}

#Preview {
    LabelExample()
}
