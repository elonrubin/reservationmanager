//
//  Reservation.swift
//  CodeTestTwo
//
//  Created by Elon Rubin on 4/14/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation

struct Reservation {
    var date = Date()
    var id = String()
    var number_of_people = Int()
    var start_time = String()
    var status = String()
    var guest = Guest(email: String(), full_name: String(), id: String(), notes: String(), phone: String())
    
    init(date: String?, id: String, number_of_people: String, start_time: String, status: String, guest: Guest) {
   
        if (date != nil) && date != "" {
       
            self.date = dateFromString(dateString: date!)!
        }
        
        self.id = id
        self.number_of_people = Int(number_of_people)!
        self.start_time = start_time
        self.status = status
        self.guest = guest
    }
    
    private func dateFromString(dateString :String) -> Date? {
        
        guard dateString != "" else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

            let date = dateFormatter.date(from: dateString)
        
            return date
        }
}

