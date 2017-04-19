//
//  ViewController.swift
//  CodeTestTwo
//
//  Created by Elon Rubin on 4/14/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    ////////////////////////////
    // MARK: IBOutlets
    ////////////////////////////
    
    @IBOutlet weak var sortDescriptionBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerView: UIVisualEffectView!

    var reservations = [Reservation]() // data for table
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
       // datePicker.addTarget(self, action: #selector(self.onDidChangeDate(sender:)), for: .valueChanged)
        datePicker.setValue(UIColor.white, forKey: "textColor")
        ReservationMethods.getReservations { (didFinish) in
            if (didFinish) {
                self.reservations = ReservationMethods.reservationsSortedByPartySize
                DispatchQueue.main.async {
                    self.title = "All Reservations"
                    self.tableView.reloadData()
                }
            }
        }

    }

 ////////////////////////////
 // MARK: IBActions
 ////////////////////////////
    
    // Sort
    
    @IBAction func sortButtonPressed(_ sender: Any) {
        let ac = constructAlertController()
        DispatchQueue.main.async {
            self.present(ac, animated: true, completion: nil)
        }
    }
    
    @IBAction func sortButtonLabelPressed(_ sender: Any) {
        let ac = constructAlertController()
        DispatchQueue.main.async {
            self.present(ac, animated: true, completion: nil)
        }
    }
    
    // Date Picker Actions
    
    @IBAction func changeDateButtonPressed(_ sender: Any) {
        self.navigationController?.toolbar.isHidden = true
        datePickerView.isHidden = false
    }
    
    @IBAction func cancelButtonDateViewPressed(_ sender: Any) {
        datePickerView.isHidden = true
        self.navigationController?.toolbar.isHidden = false
    }
    
    
    @IBAction func confirmDateChangeButtonPressed(_ sender: Any) {
        self.confirmChangedDate()
    }
   
    
    @IBAction func clearDateFiltersButtonPressed(_ sender: Any) {
     self.clearDateFilters()
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    ////////////////////////////
    // MARK: TableView Methods
    ////////////////////////////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let reservation = reservations[indexPath.row]
        let guest = reservation.guest
      //  print(reservation)
        
        cell.textLabel?.text = "\(guest.full_name) (Party Size: \(reservation.number_of_people))"
        
        let dateString = ReservationMethods.convertDateToString(date: reservation.date)
        cell.detailTextLabel?.text = "\(dateString) - \(reservation.start_time)"
        
        return cell
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
}

