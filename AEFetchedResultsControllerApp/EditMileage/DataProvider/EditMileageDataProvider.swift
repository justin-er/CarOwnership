//
//  EditMileageDataProvider.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import CoreData

class EditMileageDataProvider: EditMileageDataProviderInput {
	
	weak var delegate: EditMileageDataProviderDelegate?
	
	func getCar(by modelID: String) -> Car? {
		
		guard let objectID = DBManager.shared.objectID(with: modelID) else {
            return nil
        }
        
        let managedCar = DBManager.shared.context.registeredObject(for: objectID) as? ManagedCar
		return managedCar?.makeCar()
	}
    
    func updateObject(with modelID: String, by car: Car) {
		
        guard let objectID = DBManager.shared.objectID(with: modelID) else {
            return
        }
        
        let managedCar = DBManager.shared.context.registeredObject(for: objectID) as? ManagedCar
        managedCar?.update(by: car)
        DBManager.shared.saveContext()
    }
}
