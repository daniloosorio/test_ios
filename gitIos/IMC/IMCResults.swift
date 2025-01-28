//
//  IMCResults.swift
//  gitIos
//
//  Created by Danilo Osorio on 15/01/25.
//

import SwiftUI

struct IMCResults: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Tu resultado").font(.title).bold().foregroundColor(.white)
            InformationView(result: calculateImc(weight:userWeight,height:userHeight))
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
    }
}
func calculateImc(weight:Double,height:Double) -> Double{
    
    return weight/((height/100) * (height/100))
}

struct InformationView:View {
    let result:Double
    var body: some View{
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundColor(information.2).font(.title).bold()
            Spacer()
            Text("\(result,specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal,8)
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16).padding(16)
    }
}
func getImcResult(result:Double)-> (String, String,Color){
    let tittle:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00...19.99:
        tittle="Peso bajo"
        description="estas por debajo del peso"
        color=Color.yellow
    case 20.00...24.99:
        tittle="Peso normal"
        description="estas en el peso recomendado"
        color=Color.green
    case 25.00...29.99:
        tittle="sobre peso"
        description="estas por ensima del peso recomendado"
        color=Color.orange
    case 30.00...100:
        tittle="Obesidad"
        description="estas muy por esima del peso recomendado"
        color=Color.red
    default:
        tittle = "ERROR"
        description = "Ha ocurrido un error"
        color = Color.gray
    }
    return (tittle,description,color)
}
#Preview {
    IMCResults(userWeight: 70, userHeight: 170)
}
