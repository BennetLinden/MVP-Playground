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
    private let externalAPI: ExternalAPI
    private var characters: [Character] = []
    
    weak var view: CharacterListViewController?
    
    init(coordinator: MarvelCoordinator, externalAPI: ExternalAPI) {
        self.coordinator = coordinator
        self.externalAPI = externalAPI
    }
    
    func viewDidLoad() {
        let params: [String: Any] = MarvelParamsBuilder().build()
        let request: Promise<MarvelResponse<[Character]>> = externalAPI.request(Route(.get, .marvel(.characters), with: params))
        request.map { response in
            response.results
        }.done { characters in
            self.characters = characters
            self.view?.tableView.reloadData()
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
        
        Analytics.track(event: .onboarding(.lostBike))
        
        
        let character = characters[indexPath.row]
        coordinator.showCharacterDetails(for: character)
    }
}
