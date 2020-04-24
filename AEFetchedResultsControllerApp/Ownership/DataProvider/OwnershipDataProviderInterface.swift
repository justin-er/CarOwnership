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
    func objectUrl(at indexPath: IndexPath) -> (ownerUrl: URL?, carUrl: URL?, manufacturerUrl: URL?)
    
    var sectionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
    
    func relaodData()
    
    func deleteObject(at indexPath: IndexPath)
    func deleteObject(with url: URL)
    func updateObject(at indexPath: IndexPath, by data: Ownership)
    func updateObject(with url: URL, by data: Ownership)
    func insertObject(by data: Ownership)

}
