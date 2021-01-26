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
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}
