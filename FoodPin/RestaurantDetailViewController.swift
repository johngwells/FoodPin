//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Johnny Mandela on 3/12/17.
//  Copyright © 2017 Johnny Mandela. All rights reserved.
//

import UIKit

// Added UITableViewDataSource & UITableViewDelegate to the Class
class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        //Configure the cell, Clicked Cell: changed class to RestaurantDetailViewController. Connect Field & Value label
        // Switch is used instead of if/else so when the first
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
            cell.fieldLabel.text = "Been Here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I've been here before" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        // Make cells transparent
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    // Establish a connection with the table view object in storyboard
    // Right clicked table View, + Source & Delegate to RestaurantDetail View controller
    @IBOutlet var tableView:UITableView!
    
    // Make connections to labels
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // very light grey to the table cells
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        // remove separators of the empty rows
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // color of the separators for content rows
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurant.image)
        
        // navigationBar Restaurant Title Name
        title = restaurant.name
        
 /*       restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = restaurant.type
        restaurantLocationLabel.text = restaurant.location */

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // swipe hide navbar disable on detail view
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
