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
    var manufacturer:   ManufacturerViewModel

    init(ownerhsip: Ownership) {
        self.person = Person(
    }
}


