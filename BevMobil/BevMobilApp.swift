//  Project Name: FinalProjectApp.swift
//  Folder: FinalProject
//  Description:
//  Created by Zack Sai, Gina Bucciarelli, and Fatima Enriquez on 5/15/22.
//  Updated:
//

import SwiftUI
// This is the driver file that instantiates the app.
@main
//Struct is like the class and App is like Main
// App can have a view (like a screen)
struct BevMobilApp: App {
    
    // Create order, profile object to keep track of current order in all other views
    @StateObject var order = Order()
    @StateObject var profile = Profile()
    
    // Body of app(struct)
    var body: some Scene {
        
        // Use window group to contain MainView
        WindowGroup {
            //App instanciates MainView() and executes it
            CreateProfileView() // pass order & profile in so program can keep track of it everywhere else
                .environmentObject(order)
                .environmentObject(profile)
        }
    }
    
    
}
    
        
