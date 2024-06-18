//
//  WeatherManager.swift
//  Clima
//
//  Created by Alexander Bokhulenkov on 18.06.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4d75a3aa2f9e5b17337e796f5360675e&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
