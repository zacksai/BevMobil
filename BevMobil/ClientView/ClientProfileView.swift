//
//  ClientProfileView .swift
//  FinalProject
//
//  Created by Fatima Enriquez on 5/15/22.
//

import SwiftUI
// This displays all of the client profile info.
struct ClientProfileView: View {
    
    @State private var customerName = ""
    @State private var customerAddress = ""
    
    
    
    var body: some View {
        Text("Hello, World!")
        
        
    }
}

struct ClientProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ClientProfileView().environmentObject(Order())
    }
}
