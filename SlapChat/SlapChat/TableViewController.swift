//
//  TableViewController.swift
//  SlapChat
//
//  Created by Flatiron School on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData


class TableViewController: UITableViewController {

    var messages: Set<Message> = []
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        store.fetchData()
//    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        //store.fetchData()
        tableView.reloadData()
        
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.messages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        let messageArray = Array(messages)
        let eachMessage = messageArray[indexPath.row]
        cell.textLabel?.text = eachMessage.content
        
        return cell
    }
}