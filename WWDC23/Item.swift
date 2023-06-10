//
//  Item.swift
//  WWDC23
//
//  Created by 강병민 on 2023/06/10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
