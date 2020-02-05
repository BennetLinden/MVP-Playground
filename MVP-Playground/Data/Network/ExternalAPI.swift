//
//  ExternalAPI.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Alamofire
import Foundation
import PromiseKit

struct ExternalAPI: RemoteAPI {
    
    private let sessionManager: SessionManager
    private let decoder: JSONDecoder
    
    init(sessionManager: SessionManager, decoder: JSONDecoder = .defaultDecoder) {
        self.sessionManager = sessionManager
        self.decoder = decoder
    }
    
    func request<Type: Decodable>(_ route: Route) -> Promise<Type> {
        Promise { seal in
            self.sessionManager
                .request(route)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        if let json = try? JSONSerialization.jsonObject(with: data) {
                            print(json)
                        }
                        do {
                            seal.fulfill(try self.decoder.decode(Type.self, from: data))
                        } catch let error {
                            seal.reject(error)
                        }
                    case .failure(let error):
                        print(error)
                        if let data = response.data, let json = try? JSONSerialization.jsonObject(with: data) {
                            print(json)
                        }
                        seal.reject(error)
                    }
            }
        }
    }
}
