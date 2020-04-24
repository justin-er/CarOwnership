//
//  OwnershipDocument.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct Ownership {
    
    var owner: Person
    var car: Car
}

extension Ownership: Equatable {
    
    static func == (lhs: Ownership, rhs: Ownership) -> Bool {
        return lhs.owner.name == rhs.owner.name
    }
}
