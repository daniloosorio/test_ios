//
//  MenuView.swift
//  gitIos
//
//  Created by Danilo Osorio on 14/01/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: IMCView(), label: {
                    Text("IMC Calculator")
                })
                NavigationLink(destination: SuperHeroSearcher()){
                    Text("Super hero")
                }
                NavigationLink(destination: FavPlaces()){
                    Text("Fav Places")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
