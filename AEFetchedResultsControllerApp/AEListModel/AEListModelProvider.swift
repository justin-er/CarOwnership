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
    
    var objects: [Model]? { get }
    var sectionIndexTitles: [String] { get }
    var sectionsCount: Int? { get }
    
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func object(at indexPath: IndexPath) -> Model
}
