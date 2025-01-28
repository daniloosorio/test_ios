//
//  ImageExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 13/01/25.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("icon")
            .resizable()
            .scaledToFit()
            .frame(width: 200,height: 100)
        
        Image(systemName: "sun.min.fill").resizable().frame(width: 100,height: 200)
    }
}

#Preview {
    ImageExample()
}
