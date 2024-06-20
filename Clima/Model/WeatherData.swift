//
//  WeatherData.swift
//  Clima
//
//  Created by Alexander Bokhulenkov on 19.06.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let coord: Coord
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let humidity: Double
    let pressure: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Coord: Codable {
let lon: Double
    let lat: Double
}
