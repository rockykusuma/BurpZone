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
    var restaurant:Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = restaurant.name
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:240.0/255.0, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
            cell.fieldLabel.text = "Been here"
        cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I've been here before" : "No"
        default:
            cell.fieldLabel.text = ""
        cell.valueLabel.text = ""
        }
        return cell
    }
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


