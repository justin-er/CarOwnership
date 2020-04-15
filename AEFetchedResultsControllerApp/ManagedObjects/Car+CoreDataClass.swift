//
//  Car+CoreDataClass.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Car)
public class Car: NSManagedObject {

    convenience init(contex: NSManagedObjectContext, model: String, mileage: Int32, owener: Person?) {
        self.init(context: contex)
        
        self.model = model
        self.mileage = mileage
        self.owner = owner
    }
}
