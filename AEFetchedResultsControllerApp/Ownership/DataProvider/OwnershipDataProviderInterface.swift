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
    var sectionsCount: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    
    func relaodData()
    
    func deleteObject(at indexPath: IndexPath)
    func addSomething()
    func saveSomething()
}
