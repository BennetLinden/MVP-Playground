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
    
    lazy private var externalAPI = ExternalAPI(sessionManager: .marvel)
    
    weak var view: CharacterListViewController?
    
    func viewDidLoad() {
        let params: [String: Any] = MarvelParamsBuilder().build()
        let request: Promise<MarvelResponse<[Character]>> = externalAPI.request(Route(.get, Marvel.characters, with: params))
        request.map { response in
            response.results
        }.done { characters in
            print(characters)
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
}
