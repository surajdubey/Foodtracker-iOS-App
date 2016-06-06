//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by ServesyOfficial on 6/4/16.
//  Copyright © 2016 servesy. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    //MARK: Properties
    
    var meals = [Meal]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load sample meals
        loadSampleMeals()
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")!
        let meal1 = Meal(name: "Carpese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")
        let meal2 = Meal(name: "Chicken and potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")
        let meal3 = Meal(name: "Pasta with meatballs", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealTableViewCell"
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        //fetch appropriate meal from data source
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal {
            
            //Add new meal
            let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
            meals.append(meal)
            
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
}
