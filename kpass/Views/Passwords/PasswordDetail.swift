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
                Button(action: {
                    //editPassword
                }) {
                    Image(systemName: "pencil")
                }
            }
            Text("Password: *******")
            Text("Password: \(password.password!)")
        }
        .navigationTitle(password.service!)
        .navigationBarTitleDisplayMode(.inline)
        
        //TITLE
            //Edit button with pencil
        
        //BOX
            //Password in *****
            //Show button
            //Copy button
        
        
    }
}

//struct PasswordDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordDetail()
//    }
//}
