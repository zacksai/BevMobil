//
//  Profile.swift
//  FinalProject
//
//  Created by Zack Sai on 5/17/22.
//  Helper class to initialize profile

import SwiftUI

// A profile has a name, number, address, and t/f for customer/business, and hours
class Profile: ObservableObject {
    
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    @Published var address: String = ""
    @Published var hours: String = ""
    @Published var business: Bool = false
    
    // default constructor
    internal init(name: String = "", phoneNumber: String = "", address: String = "", business: Bool = false, hours: String = "") {
        self.name = name
        self.phoneNumber = phoneNumber
        self.address = address
        self.business = business
        self.hours = hours
    }
    
    
}

