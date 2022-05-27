//
//  ItemRow.swift
//  FinalProject
//
//  Created by Zack Sai on 5/16/22.
//

import SwiftUI

struct ItemRow: View {
    
    
    
    // a menu item is defined in the menu file, it's just that: an item
    let item: MenuItem
    
    // Create dictionary of colors and their corresponding letters to display
    let colors:[String: Color] = ["D": .purple, "G":.black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        
        // Use HStack to create item row:
        HStack{
            
            // Place image in first position
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            //  Then, stack the name and price
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            
            // Align dietary restriction to the right using a loop
            ForEach (item.restrictions, id : \.self){
                restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black )
                    .padding(5)
                    .background(colors[restriction,
                        default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        // Pass example in
        ItemRow(item: MenuItem.example)
    }
}
