//
//  EpisodeListPresenter.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

final class EpisodeListPresenter {
    
    private let coordinator: RickAndMortyCoordinator
    private let episodeRepository: EpisodeRepository
    private var episodes: [Episode] = []
    
    weak var view: EpisodeListView?
    
    init(coordinator: RickAndMortyCoordinator, episodeRepository: EpisodeRepository) {
        self.coordinator = coordinator
        self.episodeRepository = episodeRepository
    }
    
    func viewDidLoad() {
        episodeRepository.getEpisodes().done { [weak self] episodes in
            self?.episodes = episodes
            self?.view?.reload()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    var numberOfRows: Int {
        episodes.count
    }
    
    func title(forIndexPath indexPath: IndexPath) -> String {
        let episode = episodes[indexPath.row]
        return "\(episode.episode) - \(episode.name)"
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        
    }
}
