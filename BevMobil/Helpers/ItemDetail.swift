//
//  ItemDetail.swift
//  FinalProject
//
//  Created by Zack Sai on 5/16/22.
//

import SwiftUI

struct ItemDetail: View {
    
    // Bring in the order object
    @EnvironmentObject var order: Order
    
    // Create item to reference throughout the body
    let item: MenuItem
    
    var body: some View {
        
        // Add elements vertically
        // Vertical stack, Hstack Horizontal
        VStack{
            //inside Zstack, have image & photo credit
            // Stack photo credit on top of photo
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.title)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
                
            Text(item.description)
                .padding()
            
            Button("Add to Order"){
                order.add(item: item)
            }
            .font(.headline)

            
            // push everything to top
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        // Pass item in
        ItemDetail(item: MenuItem.example)
            // provide default order
            .environmentObject(Order())
    }
}
