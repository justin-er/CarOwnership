//
////
////  NSFetchedResultsController.swift
////  AEFetchedResultsControllerApp
////
////  Created by Amirreza Eghtedari on 16.04.20.
////  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//extension NSFetchedResultsController<ManagedCar>: OwnershipListProvider{
//    
//    var ownershipObjects: [Ownership]? {
//        get {
//            let objects = self.fetchedObjects
//        }
//    }
//    
//    var ownershipSections: [OwnsershipSectionInfo]?
//    
//    var ownershipSctionIndexTitles: [String] = []
//    
//    func ownershipSection(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int {
////
//    }
//    
//    func ownershipSectionIndexTitle(forSectionName sectionName: String) -> String? {
//        <#code#>
//    }
//    
//    func ownershipObject(at indexPath: IndexPath) -> Car {
//        <#code#>
//    }
//    
//    func indexPath(forOwnershipObject object: Car) -> IndexPath? {
//        <#code#>
//    }
//    
//   
//
//
//}
