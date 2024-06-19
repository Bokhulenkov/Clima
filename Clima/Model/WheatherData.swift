//
//  WheatherData.swift
//  Clima
//
//  Created by Alexander Bokhulenkov on 19.06.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WheatherData: Decodable {
    let name: String
    let main: Main
    let weather: Weather
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Double
    let pressure: Double
}

struct Weather: Decodable {
    let description: String
}
