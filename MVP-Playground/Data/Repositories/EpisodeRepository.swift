//
//  EpisodeRepository.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

protocol EpisodeRepository {
    func getEpisodes() -> Promise<[Episode]>
}

final class EpisodeDataRepository {
    
    private let remoteAPI: RemoteAPI

    init(remoteAPI: RemoteAPI) {
        self.remoteAPI = remoteAPI
    }
}

extension EpisodeDataRepository: EpisodeRepository {
    
    func getEpisodes() -> Promise<[Episode]> {
        let request: Promise<RickAndMortyResponse<[Episode]>> = remoteAPI.request(Route(.get, .rickAndMorty(.episodes)))
        return request.map { $0.results }
    }
}
