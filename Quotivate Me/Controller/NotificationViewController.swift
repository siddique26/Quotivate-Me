//
//  NotificationViewController.swift
//  Quotivate Me
//
//  Created by Siddique on 05/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationViewController: UITableViewController {
    let userId = "userId"
    let notify = Notify()
    var enableSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white
        tableView.register(Notify.self, forCellReuseIdentifier: userId)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (didAllow, error) in
            
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userId, for: indexPath) as! Notify
        cell.label.text = "Enable Push Notification"
//        cell.enable.isOn = false
        cell.enable.addTarget(self, action: #selector(enableNotification(_:)), for: .valueChanged)
        return cell
    }
    @objc func enableNotification(_ sender: UISwitch){
        if sender.isOn == true{
            let content = UNMutableNotificationContent()
            content.title = "Quotivate Me"
            let quotesText = Quotes()
            let random = Int(arc4random_uniform(UInt32(quotesText.quotes.count)))
            content.subtitle = quotesText.names[random]
            content.body = quotesText.quotes[random]
            content.badge = 1
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "TimerDone", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        } else {
            print("off")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
