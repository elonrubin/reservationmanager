//
//  Reservations Helper.swift
//  CodeTestTwo
//
//  Created by Elon Rubin on 4/14/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandler = (_ didFinish: Bool) -> Void

class ReservationMethods{
    
    
    static var allReservations = [Reservation]()
    static var reservationsSortedByPartySize = ReservationMethods.allReservations.sorted{$1.number_of_people < $0.number_of_people}
    
     static func getReservations (completion: @escaping CompletionHandler) {
        Alamofire.request("http://private-030b4-codetest3.apiary-mock.com/reservations").responseJSON { (responseData) -> Void in
            print("got response")
            let postsRawData = JSON(responseData.data!)["data"].arrayValue
            let extractedReservations = postsRawData.map({ (element) -> Reservation in
                
                let guestObject = element["guest"].dictionaryObject as! [String:String]
                print(guestObject)
                let guest = Guest(email: guestObject["email"]!, full_name:  guestObject["full_name"]!, id:  guestObject["id"]!, notes:  guestObject["notes"]!, phone:  guestObject["phone"]!)
                return Reservation(date: element["date_time"].stringValue, id: element["id"].stringValue, number_of_people: element["number_of_people"].stringValue, start_time: element["start_time"].stringValue, status: element["status"].stringValue, guest: guest)
            })
            self.allReservations = extractedReservations
            completion(true)
            }
        }
    
    static func convertDateToString (date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
}
