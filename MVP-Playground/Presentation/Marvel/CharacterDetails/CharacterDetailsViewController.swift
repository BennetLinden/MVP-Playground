//
//  CharacterDetailsViewController.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 03/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    
    private let presenter: CharacterDetailsPresenter
    
    init(presenter: CharacterDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}

