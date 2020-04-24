//
//  ManagedPerson+CoreDataClass.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedPerson)
public class ManagedPerson: NSManagedObject {

    convenience init(context: NSManagedObjectContext, name: String, birthdate: Date, cars: Set<ManagedCar>?) {
        self.init(context: context)
        
        self.name = name
        self.birthdate = birthdate
        self.cars = cars as NSSet?
    }
    
    func makePerson() -> Person {
        return Person(birthdate: self.birthdate!,
        name: self.name!)
    }
    
    func update(person: inout Person)  {
        
        person.birthdate        = self.birthdate!
        person.name             = self.name!
    }
    
    func update(by person: Person) {
        self.birthdate  = person.birthdate
        self.name       = person.name
    }
}
