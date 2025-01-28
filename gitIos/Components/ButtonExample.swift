//
//  ButtonExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 14/01/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("hola"){
            print("button")
        }
        Button(action: {print("hello")}, label: {
            Text("hola")
                .frame(width: 50,height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct Counter:View {
    @State var counterState = 0
    var body: some View {
        Button(action: {
            counterState += 1
        }, label: {
            Text("Contador: \(counterState)")
                .bold()
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

#Preview {
    Counter()
}
