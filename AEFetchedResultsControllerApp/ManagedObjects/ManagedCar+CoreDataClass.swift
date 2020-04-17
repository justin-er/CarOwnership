//
//  ManagedCar+CoreDataClass.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedCar)
public class ManagedCar: NSManagedObject {

    convenience init(contex: NSManagedObjectContext, model: String, manufacturer: ManagedManufacturer, mileage: Int32, owner: ManagedPerson?) {
        self.init(context: contex)
        
        self.model = model
        self.manufacturer = manufacturer
        self.mileage = mileage
        self.owner = owner
    }
}
