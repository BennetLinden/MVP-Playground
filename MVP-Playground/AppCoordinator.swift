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
    
    private lazy var rickAndMortyNavigationController = UINavigationController()
    private lazy var rickAndMortyCoordinator = RickAndMortyCoordinator(
        navigationController: rickAndMortyNavigationController,
        dependencyContainer: dependencyContainer
    )
    
    init(tabBarController: UITabBarController, dependencyContainer: DependencyContainer) {
        self.tabBarController = tabBarController
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        marvelCoordinator.start()
        rickAndMortyCoordinator.start()
        tabBarController.setViewControllers([
            marvelNavigationController,
            rickAndMortyNavigationController
        ], animated: false)
    }
}
