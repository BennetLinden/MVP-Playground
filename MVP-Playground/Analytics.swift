//
//  Analytics.swift
//  MVP-Playground
//
//  Created by Bennet van der Linden on 05/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

import Foundation

enum Analytics {

    static func track(event: Event, params: [String: Any]? = nil) {
        // Log event with analytics tracker such as Firebase
    }
}

struct Event {
    let name: String
}

protocol EventType { }

extension EventType where Self: RawRepresentable, Self.RawValue == String {
    var event: Event {
        Event(name: rawValue)
    }
}

extension Event {

    static func characterList(_ characterList: CharacterList) -> Event {
        characterList.event
    }
    
    enum CharacterList: String, EventType {
        case screen = "character_list_screen"
        case select = "character_list_select_cta"
    }
}
