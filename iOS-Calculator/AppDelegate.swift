//
//  AppDelegate.swift
//  iOS-Calculator
//
//  Created by Jesús Jiménez Sánchez on 30/6/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Setup
        setupView()

        return true
    }

    // MARK: Private methods

    private func setupView() {
        let vc = HomeViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }


}

