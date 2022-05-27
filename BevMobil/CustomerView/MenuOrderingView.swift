//
//  MenuOrderingView.swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.
//
import SwiftUI
// Select the items from the menu of a shop before checkout.
struct MenuOrderingView: View {
    
    // First, import all the menu items (reads the json file)
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    // Body contains all the items on the menu:
    var body: some View {
        
        // Create navigation view to organize items(naviagtes thru the items, organized w/ heading and subheadings)
        NavigationView{
            
            // Create List of sections
            List{
                // Load up each section header
                // this menu is from the json file
                ForEach(menu) {section in
                    // make a section (coffee, pastry, non-coffee etc)
                    Section(header: Text(section.name)){
                        
                        // In each section, create list of tappable items
                        ForEach(section.items){item in
                            NavigationLink(destination: ItemDetail(item: item)){
                            ItemRow(item: item)
                            }
                        }
                    }
                }
            } // style and add title
            
            //@TODO: change to add the shops name?
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle()) //type of list style
        }
    }
}

//this is for the simulation:
struct MenuOrderingView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOrderingView()
    }
}
