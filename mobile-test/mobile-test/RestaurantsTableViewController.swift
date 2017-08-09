//
//  RestaurantsTableViewController.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {

  // MARK: - Model
  var restaurants = [Restaurant?]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  var isSortedAscending = false
  // MARK: - VC Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Restaurants"
    restaurants = RestaurantsJSONParser.getRestaurants()
    
    addSortButton()
  }
  
  func addSortButton() {
    //let rightShareBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(self.sort))
    
    let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(self.sort))
    self.navigationItem.setRightBarButtonItems([sortButton], animated: true)
    
  }
  
  func sort() {
    if isSortedAscending {
      restaurants.sort { $0?.title?.localizedCaseInsensitiveCompare(($1?.title)!) == ComparisonResult.orderedDescending }
      isSortedAscending = false
    } else {
      restaurants.sort { $0?.title?.localizedCaseInsensitiveCompare(($1?.title)!) == ComparisonResult.orderedAscending }
      isSortedAscending = true
    }
  }

  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return restaurants.count
  }
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let restaurant = restaurants[indexPath.row]
    
   let cell = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
   
    cell.textLabel?.text = restaurant?.title
    cell.detailTextLabel?.text = restaurant?.description
   return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
   // self.performSegue(withIdentifier: "!!!!!!!!!!", sender: self)
  }

   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
}