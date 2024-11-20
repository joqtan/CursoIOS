//
//  IMCResult.swift
//  CursoIOS
//
//  Created by Joqtan on 19/11/24.
//

import SwiftUI

struct IMCResult: View {

    let weight: Float
    let height: Float

    var body: some View {
        VStack {
            Text("Tu resultado")
                .foregroundStyle(.white)
                .font(.title)
                .bold()
            let result = calculateIMC(weight: weight, height: height)
            InfoView(result: result)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgApp)
    }
}

func calculateIMC(weight: Float, height: Float) -> Float {
    return weight / (height / 100 * height / 100)
}

func getImcResult(result: Float) -> (String, String, Color) {
    switch result {
    case 0...18:
        return (
            "Poco peso",
            "Tu peso está por debajo del rango saludable. Esto podría indicar desnutrición o problemas de salud. Es importante consultar a un médico o nutricionista.",
            .orange
        )
    case 19...24:
        return (
            "Saludable",
            "Tu peso está dentro del rango saludable. Mantener una dieta balanceada y actividad física regular te ayudará a conservar este estado.",
            .green
        )
    case 25...29:
        return (
            "Sobrepeso",
            "Tu peso está por encima del rango saludable. Esto puede aumentar el riesgo de desarrollar problemas de salud como hipertensión o diabetes. Considera cambios en tu estilo de vida.",
            .yellow
        )
    case 30...39:
        return (
            "Obesidad",
            "Tu IMC indica obesidad, lo que puede tener un impacto significativo en tu salud. Es importante buscar asesoramiento médico y tomar medidas para mejorar tu bienestar.",
            .gray
        )
    case 40...100:
        return (
            "Obesidad extrema",
            "Tu IMC está en un rango crítico de obesidad extrema. Esto puede estar asociado con serios riesgos de salud. Busca atención médica especializada lo antes posible.",
            .red
        )
    default:
        return ("Error", "Error", .white)
    }
}

struct InfoView: View {
    let result: Float

    var body: some View {

        let imcLabel = getImcResult(result: result)

        VStack {
            Spacer()
            Text(imcLabel.0)
                .foregroundStyle(imcLabel.2)
                .font(.largeTitle)
                .bold()
            Spacer()
            Text(String(format: "%.2f", result))
                .foregroundStyle(imcLabel.2)
                .font(.system(size: 80))
                .multilineTextAlignment(.center)
                .bold()
            Spacer()
            Text(imcLabel.1)
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
                .padding(.horizontal, 16)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgCmp)
        .cornerRadius(16)
        .padding(16)
    }
}

#Preview {
    IMCResult(weight: 130, height: 190)
}
