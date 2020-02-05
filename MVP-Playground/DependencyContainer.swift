//
//  DependencyContainer.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 04/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

class DependencyContainer {
    
    lazy var marvelAPI = ExternalAPI(sessionManager: .marvel)
    
}
