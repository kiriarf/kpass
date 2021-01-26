//
//  AddPasswordForm.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 26/01/2021.
//

import SwiftUI
import CoreData
import UIKit

struct AddPasswordForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var service: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword = false
    @State private var isSuccessful = false
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("SERVICE")) {
                        TextField("Twitter", text: $service)
                    }
                    Section(header: Text("USERNAME")) {
                        TextField("john.appleseed@apple.com", text: $username)
                    }
                    Section(header: Text("PASSWORD")) {
                        if !showPassword {
                            SecureField("********", text: $password)
                        } else {
                            TextField("Qwerty123", text: $password)
                        }
                        Toggle(isOn: $showPassword, label: {
                            Text("Show")
                        })
                    }
                    
                    //Show button to add password only when all fields filled in
                    if self.isInfoValid() {
                        Button(action: {
                            addPassword()
                            self.isSuccessful = true
                            self.hideKeyboard()
                        }, label: {
                            Text("Add Password")
                        })
                        .alert(isPresented: $isSuccessful) {
                            Alert(title: Text("Success!"), message: Text("Password for \(service) Saved"), dismissButton: .default(Text("Got it!")))
                        }
                    } else {
                        Text("Fill in All Fields to Save")
                    }
                    
                }
                .navigationBarTitle("New Password")
            }
        }
    }
    
    //check if all fields have values
    private func isInfoValid() -> Bool {
        if service.isEmpty {
            return false
        }
        if username.isEmpty {
            return false
        }
        if password.isEmpty {
            return false
        }
        return true
    }
    
    //create a new instance of Password with values from text fields and try save it
    private func addPassword() {
        let newPassword = Password(context: viewContext)
        newPassword.service = service
        newPassword.username = username
        newPassword.password = password

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddPasswordForm_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordForm()
    }
}
