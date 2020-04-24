//
//  EditMileageDataProvider.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import CoreData

class EditMileageDataProvider: EditMileageDataProviderInterface {
    
    func object(by url: URL) -> Car? {
        
        guard let objectID = DBManager.shared.objectID(with: url) else {
            return nil
        }
        
        let managedCar = DBManager.shared.context.registeredObject(for: objectID) as? ManagedCar
        return managedCar?.makeCar()
    }
    
    func updateObject(with url: URL, by car: Car) {
        
        guard let objectID = DBManager.shared.objectID(with: url) else {
            return
        }
        
        let managedCar = DBManager.shared.context.registeredObject(for: objectID) as? ManagedCar
        managedCar?.update(by: car)
        DBManager.shared.saveContext()
    }
}
