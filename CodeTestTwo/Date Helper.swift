//
//  Date Helper.swift
//  CodeTestTwo
//
//  Created by Elon Rubin on 4/16/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation

extension MainViewController {
    
    ////////////////////////////
    // MARK: Date Picker Methods
    ////////////////////////////
    
    internal func confirmChangedDate(){
        
        // Check if any reservations exist
        let matchedReservations = ReservationMethods.allReservations.filter{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            return (dateFormatter.string(from: $0.date) == dateFormatter.string(from: self.datePicker.date))
            
        }
        
        
        guard matchedReservations.count > 0 else {
            let ac = constructDateAlertController() 
            self.present(ac, animated: true, completion: nil)
            return
        }
        
        // date format
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let chosenDateString = formatter.string(from: datePicker.date)
        
        
        DispatchQueue.main.async {
            self.navigationController?.toolbar.isHidden = false
            self.title = "Reservations for \(chosenDateString)"
            self.reservations = matchedReservations
            self.tableView.reloadData()
            self.datePickerView.isHidden = true
        }
    }
    
    internal func clearDateFilters() {
        
        DispatchQueue.main.async {
            self.navigationController?.toolbar.isHidden = false
            self.title = "All Reservations"
            self.reservations = ReservationMethods.reservationsSortedByPartySize
            self.tableView.reloadData()
            self.datePickerView.isHidden = true
        }
        
    }
    
}
