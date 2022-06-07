//
//  CardModel.swift
//  TapEmoji
//
//  Created by KODDER on 07.06.2022.
//

import UIKit

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier = 0
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
