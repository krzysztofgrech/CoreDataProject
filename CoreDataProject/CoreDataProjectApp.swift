//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Krzysztof Grech on 17/08/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject var dataController: DataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
