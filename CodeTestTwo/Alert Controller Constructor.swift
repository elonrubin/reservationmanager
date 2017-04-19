//
//  View Controller Constructor.swift
//  Network Demo
//
//  Created by Elon Rubin on 4/4/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func constructAlertController () -> UIAlertController {
    let alertController = UIAlertController(title: "Choose How You'd Like To Sort Reservations", message: nil, preferredStyle: .actionSheet)
    
    
    let allPostsAction = UIAlertAction(title: "Party Size", style: .default) { (action) in
        self.reservations = ReservationMethods.reservationsSortedByPartySize
        DispatchQueue.main.async {
            self.sortDescriptionBarItem.title = "Sorted By: Party Size"
       //     self.title = "All Posts"
            self.tableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        }
    
    }
    alertController.addAction(allPostsAction)
    
    let lastNameSortAction = UIAlertAction(title: "Last Name", style: .default) { (action) in
        
        self.reservations = ReservationMethods.allReservations.sorted{$1.guest.full_name.components(separatedBy: ", ").first! > $0.guest.full_name.components(separatedBy: ", ").first!}
        
        DispatchQueue.main.async {
       //     self.title = "Text Posts"
            self.sortDescriptionBarItem.title = "Sorted By: Last Name"
            self.tableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    alertController.addAction(lastNameSortAction)
    
    
    let startTimeSortAction = UIAlertAction(title: "Time Start", style: .default) { (action) in
        
        self.reservations = ReservationMethods.allReservations.sorted{$1.start_time > $0.start_time}
        
        DispatchQueue.main.async {
          self.sortDescriptionBarItem.title = "Sorted By: Reservation Time"
            self.tableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    alertController.addAction(startTimeSortAction)
    
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
        self.dismiss(animated: true, completion: nil)
        
    }
    alertController.addAction(cancelAction)
    
    return alertController
  
    }
    
    func constructDateAlertController () -> UIAlertController {
        let alertController = UIAlertController(title: "No Reservations Match Selected Date", message: nil, preferredStyle: .actionSheet)
        
        
        let gotItAction = UIAlertAction(title: "Got It", style: .default) { (action) in
            self.reservations = ReservationMethods.reservationsSortedByPartySize
            DispatchQueue.main.async {
                //     self.title = "All Posts"
                self.datePicker.date = Date()
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        alertController.addAction(gotItAction)
    
        return alertController
        
    }

 
}
