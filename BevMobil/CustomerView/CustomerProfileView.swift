//
//  CustomerProfileView.swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.
//
//@TODO: Need to add an edit bar like in CheckOut! (to edit)
import SwiftUI
// This displays all the customers profile info.
struct CustomerProfileView: View{
    
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        // Store in navigation view
        
        // Use Navigation View to store info
        NavigationView{
            
            // Create a list of HStacks containing profile data
            List{
                Section{
                    HStack{ // Present name
                        Image(systemName: "person.circle")
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Name")
                                .font(.headline)
                            Text($profile.name.wrappedValue)
                                .font(.body)
                        }
                    }
                }
                Section{
                    HStack{ // Present phone #
                        Image(systemName: "phone")
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Phone Number")
                                .font(.headline)
                            Text($profile.phoneNumber.wrappedValue)
                                .font(.body)
                        }
                    }
                }
                Section{
                    HStack{ // Present business Y/N
                        Image(systemName: "cup.and.saucer")
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Business")
                                .font(.headline)
                            if profile.business{
                                Text("Yes")
                                    .font(.body)
                            } else {
                                Text("no")
                                    .font(.body)
                            }
                        }
                    }
                }
                    if profile.business{ // Present hours if Y
                        Section{
                            HStack{
                                Image(systemName: "clock")
                                Spacer()
                                VStack(alignment: .trailing){
                                    Text("Hours")
                                        .font(.headline)
                                    Text($profile.hours.wrappedValue)
                                        .font(.body)
                                }
                            }
                        }
                    }
                Section{
                    HStack{ // Present address
                        Image(systemName: "house")
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Address")
                                .font(.headline)
                            Text($profile.address.wrappedValue)
                                .font(.body)
                        }
                    }
                }
            } // Style
            .navigationTitle("Profile")
            .font(.largeTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
       
    }
}

struct CustomerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerProfileView()
            .environmentObject(Profile())

    }
    
}
