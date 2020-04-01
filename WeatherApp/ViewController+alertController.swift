//
//  ViewController+alertController.swift
//  WeatherApp
//
//  Created by Andrey Andryukhin on 01.04.2020.
//  Copyright © 2020 Andrey Andryukhin. All rights reserved.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "New York", "Moscow", "Lisbon", "Berlin"]
            tf.placeholder = cities.randomElement()
        }
        
        let searchAction = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(searchAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true, completion: nil)
    }
}
