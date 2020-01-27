//
//  Route.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Alamofire
import Foundation

struct Route {

    let method: HTTPMethod
    let endpoint: Endpoint
    let parameters: [String: Any]?
    let headers: HTTPHeaders?

    init(_ method: HTTPMethod, _ endpoint: Endpoint, with params: [String: Any]? = nil, headers: HTTPHeaders? = nil) {
        self.method = method
        self.endpoint = endpoint
        self.parameters = params
        self.headers = headers
    }
}

extension Route: URLRequestConvertible {
    
    private var encoding: ParameterEncoding {
        switch method {
        case .get, .delete: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let request = try URLRequest(url: endpoint.url, method: method, headers: headers)
        return try encoding.encode(request, with: parameters)
    }
}
