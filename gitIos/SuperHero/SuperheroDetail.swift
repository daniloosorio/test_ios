//
//  SuperheroDetail.swift
//  gitIos
//
//  Created by Danilo Osorio on 20/01/25.
//

import SwiftUI
import Charts

struct SuperheroDetail: View {
    let id:String
    
    @State var superhero: ApiNetwork.SuperheroCompleted? = nil
    @State var loading:Bool = true
    var body: some View {
        VStack{
            if loading {
                ProgressView().tint(.white)
            }else if let superhero = superhero {
                AsyncImage(url: URL(string: superhero.image.url)) { phase in
                    // Define el comportamiento para diferentes estados de carga
                    switch phase {
                    case .empty:
                        ProgressView() // Muestra un indicador de progreso mientras carga
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 350)
                            .clipped()// Ajusta el tamaño de la imagen
                    case .failure:
                        Text("Error al cargar la imagen") // Muestra un mensaje en caso de error
                    @unknown default:
                        Text("Error desconocido")
                    }
                }
                Text(superhero.name).bold().font(.title).foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self ){alias in
                    Text(alias).foregroundStyle(.gray).italic()
                }
                SuperheroStats(stats:superhero.powerstats)
                Spacer()
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundApp)
            .onAppear{
                Task{
                    do{
                        superhero = try await ApiNetwork().getHeroById(id:id)
                    }catch{
                        superhero = nil
                    }
                    loading = false
                }
            }
        
    }
}

struct SuperheroStats:View {
    let stats:ApiNetwork.Powerstats
    var body: some View {
        VStack{
            Chart{
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 25
                ).cornerRadius(5)
                    .foregroundStyle(by:.value("Category","Combate"))
                
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by:.value("Category","Durabilidad"))
                
                SectorMark(angle: .value("Count", Int(stats.intelligence) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by:.value("Category","Inteligencia"))
                
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by:.value("Category","Poder"))
                
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by:.value("Category","Velocidad"))
                
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by:.value("Category","Fuerza"))

            }
        }
            .frame(maxWidth: .infinity,maxHeight: 350)
            .background(.white)
            .cornerRadius(16)
            .padding(24)
    }
}

#Preview {
    SuperheroDetail(id:"2")
}
