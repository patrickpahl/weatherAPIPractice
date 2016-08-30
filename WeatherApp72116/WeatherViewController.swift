//
//  WeatherViewController.swift
//  WeatherApp72116
//
//  Created by Patrick Pahl on 7/21/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate  {
    //Add UISearchBarDelegate (fyi, doesnt have any req properties)
    ///Control/drag from search bar to yellow circle to set the delegate !!!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //apple func - create it
        guard let searchTerm = searchBar.text else {
            //we get the 'searchBar' property from the delegate
            return
        }
        
        searchBar.resignFirstResponder()
        
        WeatherController.getWeather(searchTerm) { (weather) in
            guard let weather = weather else {
                return
            }
            self.nameLabel.text = weather.name
            self.tempLabel.text = "\(weather.fahr) ºF"
            self.descriptionLabel.text = weather.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
