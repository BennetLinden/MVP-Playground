//
//  SessionManager+Extensions.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Alamofire
import Foundation

extension SessionManager {
    
    static var marvel: SessionManager {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let sessionManager = SessionManager(
            configuration: configuration
        )
        return sessionManager
    }
}
