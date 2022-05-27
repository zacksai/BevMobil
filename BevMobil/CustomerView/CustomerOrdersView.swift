//
//  CustomerOrdersView.swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.
//
import SwiftUI

//Customer can see their orders and completion status.
struct CustomerOrdersView: View {
    
    // Pass in order in current state
    // order is being modified as we go (add things)
    @EnvironmentObject var order: Order
    
    // Body displays all the items ordered and ability to place it
    var body: some View {
        
        // Store body in navigation view
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
                        Text("Checkout")
                    }
                }
                .disabled(order.items.isEmpty) //cant place an order if theres no items
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
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

struct CustomerOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrdersView()
            // Give default order
            .environmentObject(Order())
    }
}
