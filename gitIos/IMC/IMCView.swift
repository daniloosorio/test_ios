//
//  IMCView.swift
//  gitIos
//
//  Created by Danilo Osorio on 14/01/25.
//

import SwiftUI

struct IMCView: View {
    //init(){
    //    UINavigationBar.appearance().titleTextAttributes =
    //    [.foregroundColor: UIColor.white]
    //}
    @State var gender: Int = 0
    @State var height: Double = 100
    @State var age: Int = 18
    @State var weight: Int = 30
    var body: some View {
        VStack {
            HStack {
                ToggleButton(
                    text: "Hombre",
                    imageName: "heart.fill",
                    gender: 0,
                    selectedGender: $gender
                )
                ToggleButton(
                    text: "Mujer",
                    imageName: "star.fill",
                    gender: 1,
                    selectedGender: $gender
                )
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "Edad", number: $age)
                CounterButton(text: "Peso", number: $weight)

            }
            IMCCalculateButton(userHeigth:height, userWeight: Double(weight))

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            //.navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(
                    placement: .principal,
                    content: {
                        Text("IMC Calculator").bold().foregroundColor(.white)
                    })
            }
        // .navigationTitle("IMC Calculator")
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int

    var body: some View {
        let color =
            if gender == selectedGender {
                Color.backgroundSelected
            } else {
                Color.backgroundComponent
            }

        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(color)
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}
struct TitleText: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...200, step: 1).accentColor(
                .purple
            ).padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(
            .backgroundComponent)
    }
}

struct CounterButton:View {
    let text :String
    @Binding var number :Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                CircleButton(type: "minus",action: {if(number>0&&number<100) {number-=1}})
                CircleButton(type: "plus",action: {if(number>0&&number<100){number+=1}})
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct IMCCalculateButton:View {
    let userHeigth:Double
    let userWeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination:{
                IMCResults(userWeight: userWeight, userHeight: userHeigth)
            }){
                Text("Calcular").font(.title).bold().foregroundColor(.purple)
                    .frame(maxWidth: .infinity,maxHeight: 100).background(.backgroundComponent)
                
            }
        }
    }
}

struct CircleButton:View {
    let type :String
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }){
            ZStack{
                Circle()
                    .frame(width: 70,height: 70)
                    .foregroundColor(.purple)
                Image(systemName: type)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 25,height: 25)
            }
            
        }
    }
}

#Preview {
    IMCView()
}
