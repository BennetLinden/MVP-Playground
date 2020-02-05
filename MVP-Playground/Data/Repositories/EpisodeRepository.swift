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
        loadNextEpisodes()
    }
    
    private func loadNextEpisodes(params: [String: Any]? = nil, episodes: [Episode] = []) -> Promise<[Episode]> {
        var episodes = episodes
        let request: Promise<RickAndMortyResponse<[Episode]>> = remoteAPI.request(Route(.get, .rickAndMorty(.episodes), with: params))
        return request.then { response -> Promise<[Episode]> in
            episodes += response.results
            if let params = response.info.next?.queryItemsDictionary {
                return self.loadNextEpisodes(params: params, episodes: episodes)
            } else {
                return Promise { $0.fulfill(episodes) }
            }
        }
    }
}

extension URL {
    
    var queryItemsDictionary: [String: Any]? {
        guard let queryItems = URLComponents(url: self, resolvingAgainstBaseURL: true)?.queryItems, !queryItems.isEmpty else {
            return nil
        }
        return queryItems.reduce(into: [String: Any]()) {
            $0[$1.name] = $1.value
        }
    }
}
