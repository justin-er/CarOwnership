//
//  OwneshipDocumentConverter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct DBProviderUtility {
    
    static func convert(_ source: ManagedCar) -> Ownership? {
        
        guard let owner = source.owner, let manufacturer = source.manufacturer else {
            return nil
        }
        
        let carEnitiy = Car(model: source.model!, mileage: source.mileage)
        let personEntity = Person(birthdate: owner.birthdate!, name: owner.name!)
        let manufacturerEnity = Manufacturer(name: manufacturer.name!, ranking: Int(manufacturer.ranking))
        
        let ownership = Ownership(person: personEntity, car: carEnitiy, manufacturer: manufacturerEnity)
        
        return ownership
    }
}
