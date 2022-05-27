//
//  ShopsView.swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.
//

import SwiftUI
//@TODO: display a list of tappable shops? lol. Shops should display: name, distance, hours of operation. On tap, take to menu ordering view. (look at MenuOrdering View for ex.)

struct ShopsView: View{
    @State private var coffeeShop1 = "Origen Coffee Roasters"

    var body: some View {
        NavigationView{
            
        List{
            Section{
                NavigationLink (destination:
                    MenuOrderingView()){
                    Text("Origen Coffee Roasters")
                }
            }
            
            Section{
                NavigationLink (destination:
                    MenuOrderingView()){
                    Text("Better Buzz")
                }
            }
            
            Section{
                NavigationLink (destination:
                    MenuOrderingView()){
                    Text("Coffee Beat and Tea Leaf")
                }
            }
            
            Section{
                NavigationLink (destination:
                    MenuOrderingView()){
                    Text("Blue Bottle Coffee")
                }
            }
            
            
        }
        .navigationTitle("Local Shops")
        .font(.headline)
        .foregroundColor(.gray)

    }
}
}

struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
            .environmentObject(Order())
        
    }
}
