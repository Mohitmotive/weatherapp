//
//  SplashViewController.swift
//  MVCWeatherViewController
//
//  Created by Mohit Kumar on 20/01/25.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let splashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = splashView
        splashView.startButton.addTarget(self, action: #selector(navigateToHome), for: .touchUpInside)
    }
    
    @objc private func navigateToHome() {
        let homeVC = WeatherViewController()
        let navigationController = UINavigationController(rootViewController: homeVC)
        navigationController.modalTransitionStyle = .flipHorizontal
        self.present(navigationController, animated: true, completion: nil)
    }
}
