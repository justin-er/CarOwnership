//
//  OwnershipPresenterInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterInterface  {
    
    var objects: [OwnershipViewModel]? { get }
    func object(at indexPath: IndexPath) -> OwnershipViewModel
    func objectUrl(at indexPath: IndexPath) -> (ownerUrl: URL?, carUrl: URL?, manufacturerUrl: URL?)
    
    var sctionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
    
    func relaodData()
    
    func deleteObject(at indexPath: IndexPath)
    func deleteObject(with url: URL)
    func updateObject(at indexPath: IndexPath, by data: OwnershipViewModel)
    func updateObject(with url: URL, by data: OwnershipViewModel)
    func insertObject(by data: OwnershipViewModel)
}
