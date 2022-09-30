//
//  AppDelegate.swift
//  FoodApp
//
//  Created by ayaz on 28.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		registerDependencies()
		
		window = UIWindow(frame: UIScreen.main.bounds)
		let navigationController = UINavigationController(rootViewController: MainViewController())
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		
		return true
	}
	
	private func registerDependencies() {
		let model: ModelProtocol = Model()
		ServiceLocator.shared.register(service: model)
		let networkingService: NetworkingServiceProtocol = NetworkingService()
		ServiceLocator.shared.register(service: networkingService)
	}
}

