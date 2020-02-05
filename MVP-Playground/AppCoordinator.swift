//
//  AppCoordinator.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 03/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let tabBarController: UITabBarController
    private let dependencyContainer: DependencyContainer
    
    private lazy var marvelNavigationController = UINavigationController()
    private lazy var marvelCoordinator = MarvelCoordinator(
        navigationController: marvelNavigationController,
        dependencyContainer: dependencyContainer
    )
    
    init(tabBarController: UITabBarController, dependencyContainer: DependencyContainer) {
        self.tabBarController = tabBarController
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        tabBarController.setViewControllers([marvelNavigationController], animated: false)
        marvelCoordinator.start()
    }
}
