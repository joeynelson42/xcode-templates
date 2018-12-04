//
//  Collection+.swift
//  ImpactSharedFramework
//
//  Created by Joey Nelson on 10/23/18.
//  Copyright © 2018 impact. All rights reserved.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Collection where Element : Equatable {
    func uniqueValues() -> Array<Element> {
        var unique = Array<Element>()
        for value in self {
            if !unique.contains(value) {
                unique.append(value)
            }
        }
        return unique
    }
}
