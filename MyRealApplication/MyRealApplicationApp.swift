//
//  MyRealApplicationApp.swift
//  MyRealApplication
//
//  Created by Daydou on 30/6/2023.
//

import SwiftUI

@main
struct MyRealApplicationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
