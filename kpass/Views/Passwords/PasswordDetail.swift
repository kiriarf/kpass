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
    let pasteboard = UIPasteboard.general
    var password: Password
    @State private var showPassword = false
    @State private var isEditPressed = false
    
    var body: some View {
        ZStack {
            if !isEditPressed {
                VStack(alignment: .leading) {
                    //Username details
                    Text("Username:")
                        .font(.largeTitle)
                    Text(password.username!)
                        .padding()
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                    
                    Text("Password:")
                        .font(.largeTitle)
                    if !showPassword {
                        Text("*******")
                            .padding()
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        Button(action: {
                            self.showPassword = true
                        }, label: {
                            Text("Show")
                        }).buttonStyle(GradientButtonStyle())
                    } else {
                        Text(password.password!)
                            .padding()
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        Button(action: {
                            self.showPassword = false
                        }, label: {
                            Text("Hide")
                        }).buttonStyle(GradientButtonStyle())
                    }
                    
                    Button(action: {
                        pasteboard.string = password.password
                    }, label: {
                        Text("Copy")
                    }).buttonStyle(GradientButtonStyle())
                    
                    Button(action: {
                        self.isEditPressed = true
                    }, label: {
                        Text("Edit")
                    }).buttonStyle(GradientButtonStyle())
                }
                .padding(/*@START_MENU_TOKEN@*/.leading, -150.0/*@END_MENU_TOKEN@*/)
                .padding(.top, -300.0)
                .navigationTitle(password.service!)
                .navigationBarTitleDisplayMode(.inline)
            } else {
                Text("YEEHAW PARDNER")
                //add edit form here
//                EditPasswordForm(password: password, usrnm: password.username, pwd: password.password )
            }
            
            
        }
    }
    
    private func editPassword(_ password: Password) {
        password.username = "Updated"
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
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
