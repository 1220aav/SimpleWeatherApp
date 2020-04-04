//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Andrey Andryukhin on 01.04.2020.
//  Copyright © 2020 Andrey Andryukhin. All rights reserved.
//

import Foundation
import CoreLocation

class NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeatherModel) -> Void)?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=\(API_KEY)&q=\(city)&units=metric"
        performRequest(withURLString: urlString)
    }
    
    func fetchCurrentWeather(forLatitude latitude: CLLocationDegrees, forLongitude longitude: CLLocationDegrees) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=\(API_KEY)&lat=\(latitude)&lon=\(longitude)&units=metric"
        performRequest(withURLString: urlString)
    }
    
    fileprivate func performRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentWeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(NetworkWeatherData.self, from: data)
            guard let CurrentWeather = CurrentWeatherModel(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return CurrentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
