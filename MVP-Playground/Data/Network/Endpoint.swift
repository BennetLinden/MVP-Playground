//
//  Endpoint.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

struct Endpoint {
    
    var base: URL
    var path: String
    
    init(base: URL, path: String) {
        self.base = base
        self.path = path
    }
    
    var url: URL {
        base.appendingPathComponent(path)
    }
}

enum Marvel {
    static var characters: Endpoint {
        Endpoint(base: .marvel, path: "v1/public/characters")
    }
}


enum Constants {
    
    enum API {
        
        static var home = "/home"
    }
}
