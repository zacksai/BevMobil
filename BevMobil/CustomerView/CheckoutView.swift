//
//  CheckoutView.swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.


import SwiftUI
// checkout. enter payment details to process the order.
struct CheckoutView: View {
    
    // Keep order updated using environment object
    @EnvironmentObject var order: Order
    
    // Keep other variables updated WITHIN THIS CLASS with state object
    // default payment type, loyalty, tip, alert
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 20
    @State private var showingPaymentAlert = false
    
    // Create payment types & tip amounts as arrays
    let paymentTypes = ["Cash", "Credit Card", "BevPoints"]
    let tipAmounts = [15, 20, 25, 30]
    
    // Calculate total price:
    var totalPrice: String{
        let formatter = NumberFormatter() //(similar to java)
        formatter.numberStyle = .currency
        
        // math
        let total = Double(order.total)
        let tipValue = total/100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    // Body contains a form to check out
    var body: some View {
        
        // Form has payment type, tip, and total
        Form{
            
            // Start with payment type selection
            Section{
                // Use a 2-way binding to read & write the payment type
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                //@TODO: add if credit is chosen (look below for ex)
                // Allow user to add loyalty
                Toggle("Add bevMobil rewards #",
                       isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails{
                    TextField("Enter bevMobil ID", text: $loyaltyNumber)
                }

            }
            
            // Next let user pick tip %
            Section(header: Text("Tip?")){
                Picker("Percentage", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                    }
                }
                //@TODO look at different pickerstyles
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Finally, display the total
            Section(header: Text("Total: \(totalPrice)")
                .font(.title3)){
                Button("Confirm order"){
                    showingPaymentAlert.toggle()
                }
            }
        } // style form, add alert user that order is confirmed!
        //@TODO change total text, make it look like
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert){
            Alert(title: Text("Order confirmed"), message:
                    Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
