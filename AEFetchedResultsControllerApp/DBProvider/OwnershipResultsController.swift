//
//  AEFetchedResultsController.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import CoreData

class OwnershipResultsController<ResultType: ManagedCar>: NSFetchedResultsController<ManagedCar> {
    
}

extension OwnershipResultsController: OwnershipListProvider {
    var ownershipObjects: [Ownership]? {
        self.fetchedObjects?.compactMap { object in
            return DBProviderUtility.convert(object)
        }
    }
}
