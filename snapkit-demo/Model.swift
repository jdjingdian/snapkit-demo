//
//  Model.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/23.
//  Copyright © 2020 djing. All rights reserved.
//

import Foundation

class Contact{
    var name: String
    var email: String
    
    init(name: String, email: String){
        self.name = name
        self.email = email
    }
}

class MultiContact {
    var position: String
    var person: [Contact]
    
    init(position: String, person: [Contact]){
        self.position = position
        self.person = person
    }
}
enum Position: String {
    case leader = "Leader", member = "Member" , resign = "Resign"
}
