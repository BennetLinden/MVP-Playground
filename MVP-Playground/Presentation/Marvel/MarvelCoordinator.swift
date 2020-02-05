//
//  MarvelCoordinator.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 03/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import UIKit

class MarvelCoordinator {
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    
    init(navigationController: UINavigationController, dependencyContainer: DependencyContainer) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        let presenter = CharacterListPresenter(
            coordinator: self,
            characterRepository: dependencyContainer.characterRepository
        )
        let viewController = CharacterListViewController(
            presenter: presenter
        )
        presenter.view = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showCharacterDetails(for character: Character) {
        let presenter = CharacterDetailsPresenter(
            coordinator: self,
            character: character
        )
        let viewController = CharacterDetailsViewController(
            presenter: presenter
        )
        presenter.view = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}
