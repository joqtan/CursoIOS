//
//  IMCView.swift
//  CursoIOS
//
//  Created by Joqtan on 18/11/24.
//

import SwiftUI

struct IMCView: View {
    //    init(){
    //        UINavigationBar
    //            .appearance()
    //            .titleTextAttributes = [
    //                .foregroundColor: UIColor.white
    //            ]
    //    }

    @State var selectedGender: Int = 0
    @State var height: Float = 150
    @State var age: Int = 18
    @State var weight: Int = 70

    var body: some View {
        VStack {
            HStack {
                ToggleButton(
                    text: "Hombre", imgName: "figure.stand", gender: 0,
                    selectedGender: $selectedGender)

                ToggleButton(
                    text: "Mujer", imgName: "figure.stand.dress", gender: 1,
                    selectedGender: $selectedGender)
            }
            HeightCalculator(height: $height)
            HStack {
                IntContainer(text: "Edad", value: $age)
                IntContainer(text: "Peso", value: $weight)
            }
            IMCCalculateButton()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgApp)
        //        .navigationBarBackButtonHidden()
        //        .navigationTitle("IMC")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator").foregroundColor(.white)
            }
        }

    }
}

struct ToggleButton: View {

    let text: String
    let imgName: String
    let gender: Int
    @Binding var selectedGender: Int

    var body: some View {
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InfoText(text: text)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            selectedGender == gender ? .bgCmpSelected : .bgCmp
        )
    }
}

struct InfoText: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}

struct TitleText: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.gray)
    }
}

struct HeightCalculator: View {

    @Binding var height: Float

    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InfoText(text: "\(Int(height)) cm")
            Slider(value: $height, in: 100...290, step: 1)
                .tint(Color.purple).padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(.bgCmp)
    }
}

struct IntContainer: View {

    let text: String
    @Binding var value: Int
    
    var body: some View {
        VStack {
            TitleText(text: text)
            InfoText(text: String(value))
            HStack {

                Button(action: {
                    if value > 0 {
                        value -= 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(.purple)
                            .frame(width: 70, height: 70)
                            
                        Image(systemName: "minus")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }

                Button(action: {
                    value += 1
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(.purple)
                            .frame(width: 70, height: 70)
                            
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgCmp)
    }
}

struct IMCCalculateButton:View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {}) {
                Text("Calcular IMC")
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .background(.bgCmp)
            }
        }
        .background(.bgCmp)
    }
}

#Preview {
    IMCView()
}
