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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //        1. Create a URL
        if let url = URL(string: urlString) {
            
            //        2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //            3. Give the session a task
            
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
                    parseJSON(weatherData: safeData)
                }
            }
            //            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //            4. Start the task
            
            task.resume()
        }
        
        func parseJSON(weatherData: Data) {
            let decoder = JSONDecoder()
            do {
                let decoderData = try decoder.decode(WheatherData.self, from: weatherData)
                print(decoderData.main.temp)
            } catch {
                print(error)
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

