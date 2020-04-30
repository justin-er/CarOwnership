//
//  ManagedManufacturer+CoreDataClass.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedManufacturer)
public class ManagedManufacturer: NSManagedObject {

    convenience init(contex: NSManagedObjectContext, name: String, ranking: Int16) {
        self.init(context: contex)
        
        self.name = name
        self.ranking = ranking
    }

    func makeManufacturer() -> Manufacturer {
        return Manufacturer(name: self.name!,
        ranking: Int(self.ranking))
    }
    
    func update(manufacturer: inout Manufacturer) {
        manufacturer.name       = self.name!
        manufacturer.ranking    = Int(self.ranking)
    }
    
    func update(by manufacturer: Manufacturer) {
        self.name       = manufacturer.name
        self.ranking    = Int16(manufacturer.ranking)
    }
}
