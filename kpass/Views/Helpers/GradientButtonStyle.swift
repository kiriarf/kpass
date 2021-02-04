//
//  GradientButtonStyle.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 26/01/2021.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("buttonTextColor"))
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("buttonColorStart"), Color("buttonColorEnd")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10.0)
    }
}
