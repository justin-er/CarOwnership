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

    init(by ownerhsip: Ownership, dateFormat: String) {
        self.person         = PersonViewModel(by: ownerhsip.person, dateFormat: dateFormat)
        self.car            = CarViewModel(by: ownerhsip.car)
        self.manufacturer   = ManufacturerViewModel(by: ownerhsip.manufacturer)
    }
}


