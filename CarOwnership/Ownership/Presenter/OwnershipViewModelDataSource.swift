//
//  OwnershipPresenterSourceInput.swift
//  CarOwnership
//
//  Created by Amirreza Eghtedari on 01.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipViewModelDataSource: class {
	
	var objects: [OwnershipViewModel]? { get }
    func object(at indexPath: IndexPath) -> OwnershipViewModel
    func objectModelId(at indexPath: IndexPath) -> (ownerModelId: String?, carModelId: String?, manufacturerModelId: String?)
    
    var sctionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
}
