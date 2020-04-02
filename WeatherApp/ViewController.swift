//
//  ViewController.swift
//  WeatherApp
//
//  Created by Andrey Andryukhin on 01.04.2020.
//  Copyright © 2020 Andrey Andryukhin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBAction func searchAction(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] cityName in
            self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
    }
    
    func updateInterfaceWith(weather: CurrentWeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
//            self.feelingLabel.text = weather.feelsLikeTemperatureString
            self.weatherIcon.image = UIImage(systemName: weather.systemIconNameString)
            self.cityNameLabel.text = weather.city
        }
    }
}

