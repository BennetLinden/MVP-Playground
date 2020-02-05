//
//  RickAndMortyResponse.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

struct RickAndMortyResponse<Result: Decodable>: Decodable {
    
    let info: Info
    let results: Result
}

extension RickAndMortyResponse {
    
    struct Info: Decodable {
        let pages: Int
        let next: URL?
        
        enum RootKeys: String, CodingKey {
            case pages, next
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: RootKeys.self)
            pages = try container.decode(Int.self, forKey: .pages)
            next = try? container.decode(URL.self, forKey: .next)
        }
    }
}
