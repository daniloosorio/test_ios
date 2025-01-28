//
//  ListExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 16/01/25.
//

import SwiftUI

var pokemons = [
    Pokemon(name:"Pikachu"),
    Pokemon(name:"Charizard"),
    Pokemon(name:"Charmilion")
]

var digimons = [
    Digimon(name:"Agumon"),
    Digimon(name:"Graymon"),
    Digimon(name:"Supermon"),
    Digimon(name:"Supermon")
]

struct ListExample: View {
    var body: some View {
        VStack{
            List {
                ForEach(pokemons,id:\.name){pokemon in
                    Text(pokemon.name)
                }
            }
            List(digimons){digimon in
                Text(digimon.name)
            }
            List{
                ForEach(digimons) { digimon in
                    /*@START_MENU_TOKEN@*/Text(digimon.name)/*@END_MENU_TOKEN@*/
                }
            }
            //lista dividida
            List{
                Section(header:Text("Pokemons")){
                    ForEach(pokemons,id:\.name){pokemon in
                        Text(pokemon.name)
                    }
                }
                Section(header: Text("Digimons")){
                    ForEach(digimons){digimon in
                        Text(digimon.name)
                        
                    }
                }
            }.listStyle(.automatic)
        }
    }
}

struct Digimon :Identifiable {
    var id = UUID()
    let name:String
}
struct Pokemon {
    let name:String
}

#Preview {
    ListExample()
}
