//
//  OrdersView.swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.
//

import SwiftUI
// Here the client can view all of the incoming orders from the customers side.
struct OrdersView: View {
    @EnvironmentObject var order: Order

    var body: some View {
     
        NavigationView{
            
            //heading, list, secions
            // Create list of 2 sections (items & buttons)
            List{
                
                // First section displays item
                Section{
                    ForEach(order.items) { item in
                        // horizontal stack
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    } // Describe deletion behavior below
                    .onDelete(perform: deleteItems)
                }
                
                // Second section displays buttons
                Section{
                    NavigationLink (destination:
                        CheckoutView()){
                        Text("Checkout 🛒")
                            .bold()
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .padding()
                    }
                }
                .disabled(order.items.isEmpty) //cant place an order if theres no items
            }
            .navigationTitle("Order")
            .font(.title)
            .foregroundColor(.gray)
            .padding()
            .listStyle(PlainListStyle())
            //@TODO: check out toolbar
            .toolbar{ // allow items to be edited (removed)
                EditButton()
        }
        
    }
}
    // Remove items from order w/ the slider (remove)
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}


struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView().environmentObject(Order())
    }
}
