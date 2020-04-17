//
//  AEListModelSectionInfoProvider2.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 15.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol AEListModelSectionInfo {
    var numberOfObjects: Int { get }
    var objects: [Any]? { get }
    var name: String { get }
    var indexTitle: String? { get }
}
