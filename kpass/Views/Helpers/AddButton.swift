//
//  AddButton.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 26/01/2021.
//

import SwiftUI
import CoreData

struct AddButton: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var serviceName: String = ""
    @State var passwordString: String = ""
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        Button(action: {}) {
            Label("Add Password", systemImage: "plus")
        }
        
//        NavigationView {
////            NavigationLink(destination: Text("yeeyee")) {
////                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
////                    Image(systemName: "plus")
////                })
//                HStack {
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        Image(systemName: "plus")
//                    })
////                    Text("Hello World B")
//                }.navigationBarTitle("")
//                .navigationBarHidden(true)
//            }
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

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
