//
//  Endpoint.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

struct Endpoint {
    
    private var base: URL
    private var path: String
    private var queryItems: [URLQueryItem]?
    
    init(base: URL, path: String) {
        self.base = base
        self.path = path
    }
    
    var url: URL {
        return base.appendingPathComponent(path)
    }
}

// MARK: - Marvel Endpoint

extension Endpoint {
    
    static func marvel(_ marvel: Marvel) -> Endpoint {
        marvel.endpoint
    }
    
    enum Marvel {
        
        case characters
        case character(id: String)
        
        var endpoint: Endpoint {
            switch self {
            case .characters:
                return Endpoint(base: .marvel, path: "v1/public/characters")
            case .character(let id):
                return Endpoint(base: .marvel, path: "v1/public/characters/\(id)")
            }
        }
    }
}

// MARK: - Rick and Morty Endpoint

extension Endpoint {
    
    static func rickAndMorty(_ rickAndMorty: RickAndMorty) -> Endpoint {
        rickAndMorty.endpoint
    }
    
    enum RickAndMorty {
        
        case episodes
        case episode(id: String)
        
        var endpoint: Endpoint {
            switch self {
            case .episodes:
                return Endpoint(base: .rickAndMorty, path: "api/episode")
            case .episode(let id):
                return Endpoint(base: .rickAndMorty, path: "api/episode/\(id)")
            }
        }
    }
}
