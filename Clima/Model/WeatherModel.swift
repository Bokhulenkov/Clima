//
//  WeatherModel.swift
//  Clima
//
//  Created by Alexander Bokhulenkov on 19.06.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...231: return "bolt"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.raipn"
        case 600...622: return "Snow"
        case 701...781: return "tornado"
        case 800: return "sun.max"
        case 801...804: return "cloud.snow"
        default: return "cloud"
        }
        
    }
}
