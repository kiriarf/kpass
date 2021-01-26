//
//  AddPasswordForm.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 26/01/2021.
//

import SwiftUI
import CoreData

struct AddPasswordForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var service: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword = false
    
    var body: some View {
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
                
                if self.isInfoValid() {
                    Button(action: {
                        print("Added Password")
                    }, label: {
                        Text("Add Password")
                    })
                } else {
                    Text("Fill in All Fields to Save")
                }
                
            }
            .navigationBarTitle("New Password")
        }
    }
    
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
    
    private func addPassword() {
        withAnimation {
            let newPassword = Password(context: viewContext)
            newPassword.service = "YT"
            newPassword.password = "Pwd123!"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct AddPasswordForm_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordForm()
    }
}
