//
//  ViewController.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 24/01/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import PromiseKit
import UIKit

class ViewController: UIViewController {

    lazy var externalAPI = ExternalAPI(sessionManager: .marvel)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let params: [String: Any] = MarvelParamsBuilder().set(params: ["": ""]).build()
        let request: Promise<MarvelResponse<[Character]>> = externalAPI.request(Route(.get, .characters, with: params))
        request.map { response in
            response.results
        }.done { characters in
            print(characters)
        }.catch { error in
            print(error.localizedDescription)
        }
    }
}
