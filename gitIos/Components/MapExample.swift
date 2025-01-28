//
//  MapExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 21/01/25.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 28.476524, longitude:-16.33624 ), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    ))
    var body: some View {
        ZStack{
            MapReader { proxy in
                Map(position: $position){
                   // Marker("Pollito frito",
                     //      coordinate:CLLocationCoordinate2D(latitude:28.476524,longitude:-16.33624 ))
                    Annotation("Pollito frito",coordinate:CLLocationCoordinate2D(latitude:28.476524,longitude:-16.33624 )){
                        Circle().frame(height: 30)
                    }.annotationTitles(.visible)
                }
                //.mapStyle(.standard)
                    .mapStyle(.hybrid(elevation: .realistic,showsTraffic: true))//satelite
                /*.onMapCameraChange { context in
                 print("estamos en : \(context.region)")
                 }*/
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en: \(context.region)")
                    }.onTapGesture {coord in
                        if let coordinates = proxy.convert(coord, from: .local){
                            withAnimation{
                                position = MapCameraPosition.region(MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude:coordinates.longitude ), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                ))
                            }
                        }
                    }
            }
            VStack{
                Spacer()
                HStack{
                    Button("Ir al sur"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 28.044416, longitude:-16.5376432 ), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            ))
                        }
                    }.padding(32).background(.white).padding()
                    Button("Ir al norte"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 28.476524, longitude:-16.33624 ), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            ))
                        }
                    }.padding(32).background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
