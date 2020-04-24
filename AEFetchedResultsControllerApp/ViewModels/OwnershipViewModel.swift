//
//  OwnershipViewModel.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct OwnershipViewModel {
    var person:         PersonViewModel
    var car:            CarViewModel

    init(by ownerhsip: Ownership, dateFormat: String) {
        self.person         = PersonViewModel(by: ownerhsip.owner, dateFormat: dateFormat)
        self.car            = CarViewModel(by: ownerhsip.car)
    }
    
    func makeOwnership() -> Ownership {
        return Ownership(owner: self.person.makePerson(),
                         car: self.car.makeCar())
    }
    
    func update(ownership: inout Ownership) throws {
        self.car.update(car: &ownership.car)
        try self.person.update(person: &ownership.owner)
    }
}


