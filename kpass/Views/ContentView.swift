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
//    @State private var selectedTab = 0

    var body: some View {
        TabView {
            PasswordList()
                .tabItem {
                    Text("All Passwords")
                    Image(systemName: "tray.full.fill")
                }
                .tag(1)
            Text("hi222")
                .tabItem {
                    Text("New Password")
                    Image(systemName: "square.and.pencil")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
