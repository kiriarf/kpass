//
//  AddPasswordForm.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 26/01/2021.
//

import SwiftUI

struct AddPasswordForm: View {
    @State var service: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddPasswordForm_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordForm()
    }
}
