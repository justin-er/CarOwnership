//
//  Car+CoreDataProperties.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var model: String?
    @NSManaged public var mileage: Int32
    @NSManaged public var owner: Person?

}
