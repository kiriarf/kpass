//
//  Header.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 22/01/2021.
//

//import SwiftUI
//
//struct Header: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @State private var willMoveToNextScreen = false
//    
//    var body: some View {
//        HStack {
////            Text("My Passwords")
////                .font(.largeTitle)
////                .fontWeight(.bold)
////            Spacer()
//////            Button(action: addPassword) {
//////                Label("Add Password", systemImage: "plus")
//////            }
//            AddButton()
//        }
//        .padding(.vertical, -5.0)
//    }
//
//    private func addPassword() {
//        withAnimation {
//            let newPassword = Password(context: viewContext)
//            newPassword.service = "YT"
//            newPassword.password = "Pwd123!"
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        Header()
//    }
//}
