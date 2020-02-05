//
//  CharacterDetailsPresenter.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 03/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

final class CharacterDetailsPresenter {
    
    private let coordinator: MarvelCoordinator
    private let character: Character
    
    weak var view: CharacterDetailsView?
    
    init(coordinator: MarvelCoordinator, character: Character) {
        self.coordinator = coordinator
        self.character = character
    }
    
    func viewDidLoad() {

    }
}
