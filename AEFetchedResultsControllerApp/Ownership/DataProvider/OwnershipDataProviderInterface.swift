//
//  DBProviderInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipDataProviderInterface: class  {
    
    var objects: [Ownership]? { get }
    func object(at indexPath: IndexPath) -> Ownership
    
    var sectionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
    
    func relaodData()
    
    func deleteObject(at indexPath: IndexPath)

}
