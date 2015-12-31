//
//  RestaurantTableViewController.swift
//  BurpZone
//
//  Created by Rakesh Kusuma on 31/12/15.
//  Copyright © 2015 Devsmugglers. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants : [Restaurant] = [Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "HongKong", image: "cafedeadend.jpg", isVisited: false), Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:"homei.jpg", isVisited: false), Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image:"teakha.jpg", isVisited: false),Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location:"Hong Kong", image: "cafeloisl.jpg", isVisited: false),Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong",image: "petiteoyster.jpg",isVisited: false),Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong",image: "posatelier.jpg", isVisited: false),Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:"Sydney", image: "bourkestreetbakery.jpg", isVisited: false),Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney",image: "haighschocolate.jpg", isVisited: false),Restaurant(name: "Palomino Espresso", type: "American / Seafood", location:"Sydney", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image:"upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image:"traif.jpg", isVisited: false),Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch",location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York",image: "fiveleaves.jpg", isVisited: false),Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York",image: "cafelore.jpg", isVisited: false),Restaurant(name: "Confessional", type: "Spanish", location: "New York",
        image: "confessional.jpg", isVisited: false),Restaurant(name: "Barrafina", type: "Spanish", location: "London", image:
        "barrafina.jpg", isVisited: false),Restaurant(name: "Donostia", type: "Spanish", location: "London", image:"donostia.jpg", isVisited: false),Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image:"thaicafe.jpg", isVisited: false)]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
            
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return self.restaurants.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                let cellIdentifier = "Cell"
                let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
                
                cell.nameLabel.text = self.restaurants[indexPath.row].name
                cell.typeLabel.text = self.restaurants[indexPath.row].type
                cell.locationLabel.text = self.restaurants[indexPath.row].location
                cell.thumbnailImageView.image  = UIImage(named: self.restaurants[indexPath.row].image)
                cell.thumbnailImageView.layer.cornerRadius = 30.0
                cell.thumbnailImageView.clipsToBounds = true
                
                if self.restaurants[indexPath.row].isVisited {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
                
                return cell
    }
//    override func prefersStatusBarHidden() -> Bool {
//                    return false
//    }


    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        let callActionHandler = { (action:UIAlertAction!)-> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)",
                style: UIAlertActionStyle.Default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default,
            handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            self.restaurantIsVisited[indexPath.row] = true
            })
        optionMenu.addAction(isVisitedAction)
        
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
        // Delete the row from the data source
        //restaurants.removeAtIndex(indexPath.row)
       // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    
    //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
    }
    
    
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
            
        let shareAction = UITableViewRowAction(style: .Default, title: "Share",handler: { (action, indexPath) -> Void in
        let defaultText = "Just Checking in at " + self.restaurants[indexPath.row].name
        if let imageToShare = UIImage(named:self.restaurants[indexPath.row].image) {
        let activityController = UIActivityViewController(activityItems:[defaultText, imageToShare], applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
            }
            })
            
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete",handler: { (action, indexPath) -> Void in
        self.restaurants.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        })
            shareAction.backgroundColor =  UIColor(red: 28.0/255.0, green: 165.0/255.0,
                blue: 253.0/255.0, alpha: 1.0)
            deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue:203.0/255.0, alpha: 1.0)
            
            return [shareAction,deleteAction]
            
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showRestaurantDetail" {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let destinationVC = segue.destinationViewController as! RestaurantDetailViewController
                destinationVC.restaurant = self.restaurants[indexPath.row]
            }
        }
    }
    
    
}
