//
//  RemoteAPI.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 27/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

protocol RemoteAPI {
    func request<Type: Decodable>(_ route: Route) -> Promise<Type>
}
