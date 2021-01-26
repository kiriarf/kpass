//
//  ContentView.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 22/01/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        TabView {
            PasswordList()
                .tabItem {
                    Text("All Passwords")
                    Image(systemName: "tray.full.fill")
                }
                .tag(1)
            AddPasswordForm()
                .tabItem {
                    Text("New Password")
                    Image(systemName: "square.and.pencil")
                }
                .tag(2)
            SettingsPage()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "wrench.fill")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
