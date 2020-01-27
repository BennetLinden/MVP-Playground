//
//  MarvelResponse.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

struct MarvelResponse<Result: Decodable> {
    let results: Result
}

extension MarvelResponse: Decodable {
    
    enum RootKeys: String, CodingKey {
        case data
    }
    
    enum DataKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder
            .container(keyedBy: RootKeys.self)
            .nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        results = try container.decode(Result.self, forKey: .results)
    }
}
