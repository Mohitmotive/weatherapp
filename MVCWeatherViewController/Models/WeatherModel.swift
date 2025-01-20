//
//  WeatherModel.swift
//  MVCWeatherViewController
//
//  Created by Mohit Kumar on 20/01/25.
//

import UIKit

struct WeatherService {
    func fetchWeather(for city: String, completion: @escaping (String, UIImage?) -> Void) {
        let headers = [
            "x-rapidapi-key": "8a5cc4f202mshb89d05a79873aabp1a8b13jsn26ddbb5f1d1c",
            "x-rapidapi-host": "weather-api138.p.rapidapi.com"
        ]
        
        let urlString = "https://weather-api138.p.rapidapi.com/weather?city_name=\(city)"
        guard let url = URL(string: urlString) else {
            completion("Invalid URL", nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion("Error: \(error.localizedDescription)", nil)
                return
            }

            guard let data = data else {
                completion("No data received", nil)
                return
            }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let temperature = String(format: "%.2f", weatherResponse.main.temp - 273.15)
                let description = weatherResponse.weather.first?.description.capitalized ?? "Unknown"
                let result = "Temperature: \(temperature)°C\nWeather: \(description)"
                let weatherImage = self.getWeatherImage(for: description)
                completion(result, weatherImage)
            } catch {
                completion("Error parsing data: \(error.localizedDescription)", nil)
            }
        }.resume()
    }
    
    private func getWeatherImage(for description: String) -> UIImage? {
        switch description.lowercased() {
        case "clear sky":
            return UIImage(named: "sunny")
        case "clouds":
            return UIImage(named: "cloudy")
        case "rain":
            return UIImage(named: "rainy")
        case "snow":
            return UIImage(named: "snowy")
        case "mist":
            return UIImage(named: "misty")
        default:
            return UIImage(named: "default")
        }
    }
}

struct WeatherResponse: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
}
