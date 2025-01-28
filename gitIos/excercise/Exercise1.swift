//
//  ContentView.swift
//  gitIos
//
//  Created by Danilo Osorio on 12/01/25.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            Rectangle().frame(height: 100).foregroundColor(.orange)
            HStack {
                Circle().fill(.green)
                Rectangle().foregroundColor(.black)
                Circle().fill(.purple)
            }.foregroundColor(.red)
            Rectangle().frame(height: 100).foregroundColor(.orange)
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)

        }.background(.red)
    }
}

#Preview {
    Exercise1()
}
