//
//  Session+Extensions.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Alamofire
import Foundation

extension Session {
    
    static var marvel: Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        let sessionManager = Session(
            configuration: configuration
        )
        return sessionManager
    }
}
