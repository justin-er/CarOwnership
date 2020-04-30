//
//  ManagedManufacturer+CoreDataProperties.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedManufacturer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedManufacturer> {
        return NSFetchRequest<ManagedManufacturer>(entityName: "ManagedManufacturer")
    }

    @NSManaged public var name: String?
    @NSManaged public var ranking: Int16
    @NSManaged public var models: NSSet?

}

// MARK: Generated accessors for models
extension ManagedManufacturer {

    @objc(addModelsObject:)
    @NSManaged public func addToModels(_ value: ManagedCar)

    @objc(removeModelsObject:)
    @NSManaged public func removeFromModels(_ value: ManagedCar)

    @objc(addModels:)
    @NSManaged public func addToModels(_ values: NSSet)

    @objc(removeModels:)
    @NSManaged public func removeFromModels(_ values: NSSet)

}
