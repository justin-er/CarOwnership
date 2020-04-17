//
//  ManagedCar+CoreDataProperties.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedCar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedCar> {
        return NSFetchRequest<ManagedCar>(entityName: "ManagedCar")
    }

    @NSManaged public var mileage: Int32
    @NSManaged public var model: String?
    @NSManaged public var manufacturer: ManagedManufacturer?
    @NSManaged public var owner: ManagedPerson?

}
