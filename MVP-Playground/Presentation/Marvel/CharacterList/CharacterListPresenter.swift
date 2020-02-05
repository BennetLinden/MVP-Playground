//
//  CharacterListPresenter.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

final class CharacterListPresenter {
    
    private let coordinator: MarvelCoordinator
    private let characterRepository: CharacterRepository
    private var characters: [Character] = []
    
    weak var view: CharacterListView?
    
    init(coordinator: MarvelCoordinator, characterRepository: CharacterRepository) {
        self.coordinator = coordinator
        self.characterRepository = characterRepository
    }
    
    func viewDidLoad() {
        characterRepository.getCharacters(offset: 0).done { characters in
            self.characters = characters
            self.view?.reload()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    func didScrollToBottom() {
        characterRepository.getCharacters(offset: characters.count).done { characters in
            self.characters += characters
            self.view?.reload()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    var numberOfRows: Int {
        characters.count
    }
    
    func title(forIndexPath indexPath: IndexPath) -> String {
        characters[indexPath.row].name
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        let character = characters[indexPath.row]
        coordinator.showCharacterDetails(for: character)
    }
}
