//
//  WeatherViewController.swift
//  MVCWeatherViewController
//
//  Created by Mohit Kumar on 20/01/25.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let weatherView = WeatherView()
    private let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = weatherView
        weatherView.fetchWeatherButton.addTarget(self, action: #selector(fetchWeather), for: .touchUpInside)
        weatherView.backButton.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
    }
    
    @objc private func fetchWeather() {
        guard let city = weatherView.cityTextField.text, !city.isEmpty else {
            weatherView.weatherLabel.text = "Please enter a city name"
            return
        }
        
        weatherService.fetchWeather(for: city) { [weak self] result, weatherImage in
            DispatchQueue.main.async {
                self?.weatherView.weatherLabel.text = result
                self?.weatherView.weatherImageView.image = weatherImage
            }
        }
    }
    
    @objc private func navigateBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
