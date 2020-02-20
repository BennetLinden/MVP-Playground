//
//  CharacterRepository.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

protocol CharacterRepository {
    func getCharacters(offset: Int) -> Promise<[Character]>
}

final class CharacterDataRepository {
    
    let remoteAPI: RemoteAPI

    init(remoteAPI: RemoteAPI) {
        self.remoteAPI = remoteAPI
    }
}

extension CharacterDataRepository: CharacterRepository {
    
    func getCharacters(offset: Int) -> Promise<[Character]> {
        let params: [String: Any] = MarvelParamsBuilder()
            .set(params: ["offset": offset, "limit": 25])
            .build()
        let request: Promise<MarvelResponse<[Character]>> = remoteAPI.request(Route(.get, .marvel(.characters), with: params))
        return request.map { $0.results }
    }
}
