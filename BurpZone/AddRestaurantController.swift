//
//  AddRestaurantController.swift
//  BurpZone
//
//  Created by Rakesh Kusuma on 31/12/15.
//  Copyright © 2015 Devsmugglers. All rights reserved.
//
import UIKit

class AddRestaurantController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var locationTextField:UITextField!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    var isVisited = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yesButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        noButton.backgroundColor = UIColor.grayColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func saveBtnClicked(sender:UIBarButtonItem){
        let name = nameTextField.text
        let type = typeTextField.text
        let location = locationTextField.text
        
            if name == "" || type == "" || location == "" {
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            }
            dismissViewControllerAnimated(true, completion: nil)
            

    }
    
    @IBAction func toggleYesAndNoBtn(sender:UIButton) {
                
                // Yes button clicked
        if sender == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
            noButton.backgroundColor = UIColor.grayColor()
        } else if sender == noButton {
                isVisited = false
                yesButton.backgroundColor = UIColor.grayColor()
                noButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
            }
                
    }
    
    override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                    // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            if indexPath.row == 0 {
                if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .PhotoLibrary
                    imagePicker.delegate = self
        
                    self.presentViewController(imagePicker, animated: true, completion: nil)
                }
            }
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        leadingConstraint.active = true
        
        let trailingConstaint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        trailingConstaint.active = true
        
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        topConstraint.active = true
        
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        bottomConstraint.active = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
