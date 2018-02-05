//
//  MainTableViewController.swift
//  Quotivate Me
//
//  Created by Siddique on 05/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    let demoViewControllers:[(String,UIViewController.Type)] = [("Quotes", ViewController.self),("Push Notification", NotificationViewController.self)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quotivate Me"
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoViewControllers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(format: "s%li-r%li", indexPath.section, indexPath.row)
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell.textLabel?.text = titleForRowAtIndexPath(indexPath)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = titleForRowAtIndexPath(indexPath)
        let vc = viewControllerForRowAtIndexPath(indexPath)
        vc.title = title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        let (title, _) = demoViewControllers[indexPath.row]
        return title
    }
    
    func viewControllerForRowAtIndexPath(_ indexPath: IndexPath) -> UIViewController {
        let (_, vc) = demoViewControllers[indexPath.row]
        return vc.init()
    }
    
}

