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

    func makeCar() -> Car? {
        
        guard let manufacturer = self.manufacturer else {
            return nil
        }
        
        return Car(model: self.model!,
                   mileage: Int(self.mileage),
                   manufacturer: manufacturer.makeManufacturer())
    }
    
    func update(car: inout Car) {
        car.mileage     = Int(self.mileage)
        car.model       = self.model!
        self.manufacturer?.update(manufacturer: &car.manufacturer)
    }
    
    func update(by car: Car) {
        self.mileage    = Int32(car.mileage)
        self.model      = car.model
        self.manufacturer?.update(by: car.manufacturer)
    }
}
