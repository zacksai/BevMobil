//  File: SwiftUI CreateProfileView.swift
//  Description:
//  Created by Zack Sai, Gina Bucciarelli, and Fatima Enriquez on 5/15/22.
//  Updated:
//@TODO: pass the data from this view to the next?
import SwiftUI
// Prompts for the users to create their profile.
struct CreateProfileView: View {
    
    // Create profile obejct to keep track of profile, order
    @EnvironmentObject var profile: Profile
    @EnvironmentObject var order: Order
    
    // We only need to keep track of if all the info is input in THIS VIEW
    @State private var readyToGo = false;
    
    var body: some View {
        
        // Present appropriate view depending if info is ready to go
        if !readyToGo{
            
            // Use VStack to align data
            VStack{
                
                Spacer()
                
                Text("Welcome to BevMobil!")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("Please create your profile:")
                    .font(.subheadline)
                
                // Use form after title to input info
                Form{
                    
                    Section{ // Ask for name
                        TextField("Name", text: $profile.name)
                    }
                    Section{ // Ask for number
                        TextField("Number", text: $profile.phoneNumber)
                    }
                    Section{ // Ask for business
                        Toggle("Business?",
                               isOn: $profile.business.animation())
                        if profile.business{ // if T, ask for hours
                            TextField("Hours", text: $profile.hours)
                        }
                    }
                    Section{ // Ask for address
                        TextField("Address", text: $profile.address)
                    }
                }
                
                // Begin only when fields have data
                Button("Begin"){
                    readyToGo = true
                }
                .disabled(profile.name == "" || profile.phoneNumber == "" || profile.address == "")
                .font(.largeTitle)
                
                Spacer()
            }
       
        } // initialize MainView
        else {
            MainView()
                .environmentObject(order)
                .environmentObject(profile)
        }
        
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
            .environmentObject(Profile())
            .environmentObject(Order())
    }
}


