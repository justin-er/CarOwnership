//
//  OwnershipDocument.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct Ownership {
    
    var person: Person
    var car: Car
    var manufacturer: Manufacturer
}

extension Ownership: Equatable {
    
    static func == (lhs: Ownership, rhs: Ownership) -> Bool {
        return lhs.person.name == rhs.person.name
    }
}
