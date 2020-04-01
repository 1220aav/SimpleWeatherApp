//
//  ViewController.swift
//  WeatherApp
//
//  Created by Andrey Andryukhin on 01.04.2020.
//  Copyright © 2020 Andrey Andryukhin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let API_KEY = "0ef52d87f593f33983031c83ea2bda86"
    let cities = ["New York", "Moscow", "Lisbon", "London"]

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    let networkWeatherManager = NetworkWeatherManager()
    
    
    @IBAction func searchAction(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { cityName in
            self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
        
    }


}

