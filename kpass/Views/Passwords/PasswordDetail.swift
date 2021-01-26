//
//  PasswordDetail.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 22/01/2021.
//

import SwiftUI
import CoreData

struct PasswordDetail: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var password: Password
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Username:")
                Text(password.username!)
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                Spacer()
            }
            
            HStack {
                Text("Password:")
                Text(password.password!)
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                Spacer()
                    
            }
            
        }
        .padding()
        .navigationTitle(password.service!)
        .navigationBarTitleDisplayMode(.inline)
        
        
        
        
//        VStack {
//            HStack {
//                Button(action: {
//                    //editPassword
//                }) {
//                    Image(systemName: "pencil")
//                }
//            }
//            Text("Password: *******")
//            Text("Password: \(password.password!)")
//        }
//        .navigationTitle(password.service!)
//        .navigationBarTitleDisplayMode(.inline)
        
        //TITLE
            //Edit button with pencil
        
        //BOX
            //Password in *****
            //Show button
            //Copy button
        
        
    }
}

struct PasswordDetail_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) static var viewContext2

    static var previews: some View {
        let examplePwd = Password(context: viewContext2)
        examplePwd.service = "Twitter"
        examplePwd.username = "kiriarf"
        examplePwd.password = "Password123!"
        return PasswordDetail(password: examplePwd)
    }
}
