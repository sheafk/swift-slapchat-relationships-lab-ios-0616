//
//  RecipientTableViewController.swift
//  SlapChat
//
//  Created by Shea Furey-King on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class RecipientTableViewController: UITableViewController {
    
    let dataStore: DataStore = DataStore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataStore.fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataStore.recipients.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("recipientCell", forIndexPath: indexPath)

        let selectedRecipient = dataStore.recipients[indexPath.row]
        cell.textLabel?.text = selectedRecipient.name
        
        let messageCount = selectedRecipient.messages.count
        cell.detailTextLabel?.text = "\(messageCount)"

        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        let selectedRecipient = dataStore.recipients[indexPath!.row]
        
        let destinationVC = segue.destinationViewController as! TableViewController
        
        let messageSet = selectedRecipient.messages
        
        destinationVC.messages = messageSet
    }
    

}
