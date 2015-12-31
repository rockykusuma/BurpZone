//
//  ReviewViewController.swift
//  BurpZone
//
//  Created by Rakesh Kusuma on 31/12/15.
//  Copyright © 2015 Devsmugglers. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView : UIImageView!
    @IBOutlet weak var ratingStackView : UIStackView!
    var rating : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        ratingStackView.transform = CGAffineTransformConcat(scale, translate)
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(2.0, delay: 0.0,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    @IBAction func ratingSelected(sender:UIButton) {
        switch (sender.tag) {
            case 100 : rating = "dislike"
            case 200 : rating = "good"
            case 300 : rating = "great"
            default : break
        }
        print(sender.tag)
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }

}
