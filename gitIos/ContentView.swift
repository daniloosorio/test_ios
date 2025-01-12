//
//  ContentView.swift
//  gitIos
//
//  Created by Danilo Osorio on 12/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world")
            holi()
        }
        .padding()
    }
}

func holi (){
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
}
#Preview {
    ContentView()
}
