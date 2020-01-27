//
//  Dictionary+Extensions.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    static func makeMarvelAuthentication(date: Date = Date()) -> Self {
        let ts = DateFormatter().string(from: date)
        let privateKey = "e812dc7ea6cb99ef6915caae4de4ae574c40c010"
        let publicKey = "67130fd2f6a4fff8b701fdbd44023306"
        let hash = (ts + privateKey + publicKey).md5
        return [
            "apikey": publicKey,
            "ts": ts,
            "hash": hash
        ]
    }
    
    func appendMarvelAuthentication() -> Self {
        merging(Self.makeMarvelAuthentication(), uniquingKeysWith: { (current, _) in current })
    }
}
