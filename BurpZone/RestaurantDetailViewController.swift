//
//  RestaurantDetailViewController.swift
//  BurpZone
//
//  Created by Rakesh Kusuma on 31/12/15.
//  Copyright © 2015 Devsmugglers. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var restaurantImageView:UIImageView!
    @IBOutlet weak var ratingButton : UIButton!
    
    var restaurant:Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = restaurant.name
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:240.0/255.0, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        self.tableView.estimatedRowHeight = 36
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        if segue.identifier == "unwindToDetailView" {
            if let reviewViewController = segue.sourceViewController as? ReviewViewController {
                if let rating = reviewViewController.rating {
                ratingButton.setImage(UIImage(named: rating), forState: UIControlState.Normal)
                }
                
            }
        }
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! RestaurantDetailTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
        cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = restaurant.phoneNumber
        case 4:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I've been here before" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showMap" {
                let destinationVC = segue.destinationViewController as? MapViewController
                destinationVC?.restaurant = restaurant
            }

    }

}


