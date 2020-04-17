//
//  ManagedPerson+CoreDataProperties.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedPerson> {
        return NSFetchRequest<ManagedPerson>(entityName: "ManagedPerson")
    }

    @NSManaged public var birthdate: Date?
    @NSManaged public var name: String?
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension ManagedPerson {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: ManagedCar)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: ManagedCar)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}
