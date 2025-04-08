//
//  SplashView.swift
//  MVCWeatherViewController
//
//  Created by Mohit Kumar on 20/01/25.
//

import UIKit

class SplashView: UIView {
    
    let splashTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather App for main"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start App", for: .normal)
        button.backgroundColor = .systemBlue
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
        addSubview(splashTitleLabel)
        addSubview(startButton)
        
        NSLayoutConstraint.activate([
            splashTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            splashTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.topAnchor.constraint(equalTo: splashTitleLabel.bottomAnchor, constant: 30),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
