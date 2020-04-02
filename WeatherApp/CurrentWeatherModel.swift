//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Andrey Andryukhin on 02.04.2020.
//  Copyright © 2020 Andrey Andryukhin. All rights reserved.
//

import Foundation

struct CurrentWeatherModel {
    let city: String
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "\(feelsLikeTemperature.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData: NetworkWeatherData) {
        city = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}


