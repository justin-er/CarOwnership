//
//  CarListProvider.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipListProvider {
    var ownershipObjects: [Ownership]? { get }
//    var ownershipSections: [OwnsershipSectionInfo]? { get }
//    var ownershipSctionIndexTitles: [String] { get }
//    
//    func ownershipSection(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
//    func ownershipSectionIndexTitle(forSectionName sectionName: String) -> String?
//    func ownershipObject(at indexPath: IndexPath) -> Car
//    func indexPath(forOwnershipObject object: Car) -> IndexPath?
}
