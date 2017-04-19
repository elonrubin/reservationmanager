//
//  Guest.swift
//  CodeTestTwo
//
//  Created by Elon Rubin on 4/14/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation

struct Guest {
    var email = String()
    var full_name = String()
    var id = String()
    var notes = String()
    var phone = String()
    
    
    init(email: String, full_name: String, id: String, notes: String, phone: String) {
        self.email = email
        self.full_name = full_name
        self.id = id
        self.notes = notes
        self.phone = phone
    }
    
}
