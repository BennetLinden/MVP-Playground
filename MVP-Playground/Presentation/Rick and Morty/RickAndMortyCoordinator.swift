//
//  RickAndMortyCoordinator.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import UIKit

class RickAndMortyCoordinator {
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    
    init(navigationController: UINavigationController, dependencyContainer: DependencyContainer) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        let presenter = EpisodeListPresenter(
            coordinator: self,
            episodeRepository: dependencyContainer.episodeRepository
        )
        let viewController = EpisodeListViewController(
            presenter: presenter
        )
        presenter.view = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
}
