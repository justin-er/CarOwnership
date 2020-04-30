//
//  OwnershipDataSourceInput.swift
//  CarOwnership
//
//  Created by Amirreza Eghtedari on 30.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipDataSourceInput: class {
	
    var objects: [Ownership]? { get }
    func object(at indexPath: IndexPath) -> Ownership
    func objectModelId(at indexPath: IndexPath) -> (ownerModelId: String?, carModelId: String?, manufacturerModelId: String?)
    
    var sectionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
}
