//
//  Item.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
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
