//
//  MarvelParamsBuilder.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

class MarvelParamsBuilder {
    
    private var marvelAuthentication: [String: Any] {
        let ts = DateFormatter().string(from: Date())
        let privateKey = "e812dc7ea6cb99ef6915caae4de4ae574c40c010"
        let publicKey = "67130fd2f6a4fff8b701fdbd44023306"
        let hash = (ts + privateKey + publicKey).md5
        return [
            "apikey": publicKey,
            "ts": ts,
            "hash": hash
        ]
    }
    
    private var params: [String: Any] = [:]
    
    func set(params: [String: Any]) -> MarvelParamsBuilder {
        self.params = params
        return self
    }
    
    func add(params: [String: Any]) -> MarvelParamsBuilder {
        self.params = self.params.merging(params, uniquingKeysWith: { first, _ in first })
        return self
    }
    
    func build() -> [String: Any] {
        marvelAuthentication.merging(params, uniquingKeysWith: { (first, _) in first })
    }
}
