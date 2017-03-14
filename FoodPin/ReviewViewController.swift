//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Johnny Mandela on 3/14/17.
//  Copyright © 2017 Johnny Mandela. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    //Manipulate the container view with a growing animation *cntl+click ReviewView Controller connect outlet to View
    @IBOutlet var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Slide Down Animation *Only used for one animation
        //containerView.transform = CGAffineTransform.init(translationX: 0, y: -1000)
        
        // Combine Two Transforms
        let scaleTransform = CGAffineTransform.init(translationX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -500)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        // Set the initial state of the container view for image starting from 0 to original size * Goes with the override viewDidAppear
        //containerView.transform = CGAffineTransform.init(scaleX: 0, y:0)
    }
    
    // Create the growing effect of containerView.transform *CGA.identiy is a constant that resets to original size/position
    override func viewDidAppear(_ animated: Bool) {
        //Spring Animation
        //UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            //self.containerView.transform = CGAffineTransform.identity
        //}, completion: nil)
        
        // grows from 0 to original size. remove comment to activate
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
