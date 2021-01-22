//
//  PasswordList.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 22/01/2021.
//

import SwiftUI
import CoreData

struct PasswordList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Password.service, ascending: true)],
        animation: .default)
    private var passwords: FetchedResults<Password>
    
    var body: some View {
        List {
            ForEach(passwords) { password in
                HStack {
                    Text(password.service!)
                    Text(password.password!)
                }
            }
            .onDelete(perform: deletePasswords)
        }
    }
    
    private func deletePasswords(offsets: IndexSet) {
        withAnimation {
            offsets.map { passwords[$0] }.forEach(viewContext.delete)

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

struct PasswordList_Previews: PreviewProvider {
    static var previews: some View {
        PasswordList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
