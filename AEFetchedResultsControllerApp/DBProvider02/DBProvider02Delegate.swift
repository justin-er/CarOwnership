//
//  DBProviderDelegate02.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 17.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import CoreData

protocol DBProvider02Delegate: class {
    
    func providerDidReloadData(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>)

    func providerWillChangeContent(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>)
    
    func provider(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    
    func provider(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType)
    
    func providerDidChangeContent(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>)
}
