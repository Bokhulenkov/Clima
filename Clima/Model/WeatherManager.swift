//
//  WeatherManager.swift
//  Clima
//
//  Created by Alexander Bokhulenkov on 18.06.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWheather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4d75a3aa2f9e5b17337e796f5360675e&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //        1. Create a URL
        if let url = URL(string: urlString) {
            
            //        2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //            3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        delegate?.didUpdateWheather(self, weather: weather)
                    }
                }
            }
            
            //            4. Start the task
            task.resume()
        }
        
        func parseJSON(_ weatherData: Data) -> WeatherModel? {
            let decoder = JSONDecoder()
            do {
                let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
                let id = decoderData.weather[0].id
                let temp = decoderData.main.temp
                let name = decoderData.name
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                return weather
                
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
    }
    

    
    
    
    
    
    
    /*
     func handle(data: Data?, response: URLResponse?, error: Error?) {
     if error != nil {
     print(error!)
     }
     
     //    декодирование данных
     if let safeData = data {
     
     let dataString = String(data: safeData, encoding: .utf8)
     print(dataString)
     }
     }
     */
}

