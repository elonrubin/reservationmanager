# reservationmanager

## Installation Instructions
* (1) Unzip file
* (2) Install Pods
  * Open Terminal
  * Type "cd + \(filepathToRootDirectory)"
    * You can drag the file directory to terminal   
  * Once you are in, type "pod install"

## Notes
* Coded in XCode 8.2.1 and Swift 3.1
* Build Target - iOS 9.0+
* Cocoapods: Alamofire, SwiftyJSON
* Tap calendar to choose a date for reservations
* Tap sort button to sort by party size, time or last name


## Discussion
*   I believe the requirement for CoreData is inefficient in this context. Saving reservation objects then displaying those objects in a UITableView will reduce runtime efficiency. It also increases the amount of code in the project drastically. There are more lightweight alternatives that would be more suitable for this situation. NSUserDefaults would be able to persist this saved data
*   Should you want to implement persistence, I recommend using the Realm Cocoapod. Realm is a lightweight replacement for CoreData. It's easier to quiery and visualize data, it also uses less code than XCode
*   The requirements say "there should be a date selector which only displays dates that actually have reservations." "Actually" is ambigious in this context. The response from the endpoint has a status property. This ranges from unconfirmed, all seated, confirmed and sent message. These options are ambigious. Does sent message mean actually? Does unconfirmed mean that someone will not show up? Because of the lack of cohesiveness with this property, I display all reservations for a particular date. I would seek to clarify this data if this project hypothetically moved forward
*   A excaping completion handler, declared in Reservation Helper.swift via a Typealias, is used in lieu of Promisekit. It provides the same control flow through passing a didFinish Bool.
