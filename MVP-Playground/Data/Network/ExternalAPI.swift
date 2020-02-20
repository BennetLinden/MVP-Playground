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
    
    private let session: Session
    private let decoder: DataDecoder
    
    init(session: Session, decoder: DataDecoder = JSONDecoder.defaultDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    func request<Type: Decodable>(_ route: Route) -> Promise<Type> {
        Promise { seal in
            self.session
                .request(route)
                .validate()
                .responseDecodable(of: Type.self, decoder: decoder) { response in
                    switch response.result {
                    case .success(let data):
                        seal.fulfill(data)
                    case .failure(let error):
                        print(error)
                        if let data = response.data {
                            print(data)
                        }
                        seal.reject(error)
                    }
            }
        }
    }
}
