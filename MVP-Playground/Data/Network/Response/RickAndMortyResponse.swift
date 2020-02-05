//
//  RickAndMortyResponse.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

struct RickAndMortyResponse<Result: Decodable>: Decodable {
    
    struct Info: Decodable {
        let pages: Int
        let next: URL?
    }
    
    let info: Info
    let results: Result
}
