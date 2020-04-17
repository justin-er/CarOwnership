//
//  AEListViewModel.swift
//  AuthenticatorPaired
//
//  Created by Amirreza Eghtedari on 19/1/1399AP.
//  Copyright © 1399 AP IDmelon. All rights reserved.
//

import Foundation

protocol AEListModelProvider {
    associatedtype Model where Model: Equatable
    
    var modelObjects: [Model]? { get }
    var modelSections: [AEListModelSectionInfo]? { get }
    var modelSctionIndexTitles: [String] { get }
    
    func modelSection(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func modelSectionIndexTitle(forSectionName sectionName: String) -> String?
    func modelObject(at indexPath: IndexPath) -> Model
    func indexPath(forModelObject object: Model) -> IndexPath?
}
