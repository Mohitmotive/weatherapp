//
//  WeatherView.swift
//  MVCWeatherViewController
//
//  Created by Mohit Kumar on 20/01/25.
//

import UIKit

class WeatherView: UIView {
    
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter city name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let fetchWeatherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Weather", for: .normal)
        button.backgroundColor = UIColor.systemPurple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let weatherCardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather information will appear here"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor.systemGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemTeal
        addSubview(cityTextField)
        addSubview(fetchWeatherButton)
        addSubview(weatherCardView)
        addSubview(backButton)
        
        weatherCardView.addSubview(weatherLabel)
        weatherCardView.addSubview(weatherImageView)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            cityTextField.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cityTextField.heightAnchor.constraint(equalToConstant: 50),
            
            fetchWeatherButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            fetchWeatherButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            fetchWeatherButton.widthAnchor.constraint(equalToConstant: 200),
            fetchWeatherButton.heightAnchor.constraint(equalToConstant: 50),
            
            weatherCardView.topAnchor.constraint(equalTo: fetchWeatherButton.bottomAnchor, constant: 40),
            weatherCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            weatherCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            weatherCardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            weatherLabel.centerXAnchor.constraint(equalTo: weatherCardView.centerXAnchor),
            weatherLabel.centerYAnchor.constraint(equalTo: weatherCardView.centerYAnchor),
            
            weatherImageView.topAnchor.constraint(equalTo: weatherCardView.topAnchor, constant: 20),
            weatherImageView.centerXAnchor.constraint(equalTo: weatherCardView.centerXAnchor),
            weatherImageView.widthAnchor.constraint(equalToConstant: 100),
            weatherImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
