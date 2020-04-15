//
//  Person+CoreDataClass.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
    
    convenience init(context: NSManagedObjectContext, name: String, age: Int, cars: Set<Car>?) {
        self.init(context: context)
        
        self.name = name
        self.age = Int16(age)
        self.cars = cars as NSSet?
    }
}
