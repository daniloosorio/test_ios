//
//  SuperHeroSearcher.swift
//  gitIos
//
//  Created by Danilo Osorio on 16/01/25.
//

import SwiftUI
import SDWebImage

struct SuperHeroSearcher: View {
    @State var superHeroName:String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            //a574a6135aa556611c21152b9c9a2c51
            
            TextField("", text: $superHeroName,prompt:
                        Text("Superman...").font(.title2)
                .bold()
                .foregroundColor(.gray)
            ).font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(.purple,width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    print(superHeroName)
                    Task{
                        do{
                            wrapper =  try await ApiNetwork().getHerosByQuery(query:superHeroName)
                        }catch{print("error")}
                        loading = false
                    }
                    
                }
            if(loading){
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){superhero in
                    ZStack{
                        SuperheroItem(superhero:superhero)
                        NavigationLink(destination:SuperheroDetail(id:superhero.id)){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain).background(.backgroundApp)
            }
            
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
    }
}
struct SuperheroItem:View {
    let superhero: ApiNetwork.SuperHero
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: superhero.image.url)) { phase in
                // Define el comportamiento para diferentes estados de carga
                switch phase {
                case .empty:
                    ProgressView() // Muestra un indicador de progreso mientras carga
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 300) // Ajusta el tamaño de la imagen
                case .failure:
                    Text("Error al cargar la imagen") // Muestra un mensaje en caso de error
                @unknown default:
                    Text("Error desconocido")
                }
            }
            VStack{
                Spacer()
                Text(superhero.name).foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                .background(.white.opacity(0.5))}
        }.frame(height: 300).cornerRadius(32)
    }
}

#Preview {
    SuperHeroSearcher()
}
