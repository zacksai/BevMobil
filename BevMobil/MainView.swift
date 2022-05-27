//  MainView.swift
//  FinalProject
//
//  Created by Zack Sai on 5/16/22.
//
import SwiftUI

// Creating the SINGLETON! which is the MainView
// These are the tabs (Menu/Order..)
struct MainView: View {
    var body: some View {
        
        // Create tabview to contain an instance of shops, order, and profile view
        // TabView is creating tabs for each at the bottom.
        TabView{
            ShopsView()
                .tabItem{
                    Label("Shops", systemImage: "cup.and.saucer")
                }
            CustomerOrdersView()
                .tabItem{
                    Label("Cart", systemImage: "cart")
                }
            CustomerProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
            .environmentObject(Profile())
    }
}
