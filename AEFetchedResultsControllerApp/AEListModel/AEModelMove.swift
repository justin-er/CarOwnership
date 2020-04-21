//
//  AEMovedModel.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct AEModelMove<Model> {
    var model: Model
    var indexPath: IndexPath
    var newIndexPath: IndexPath
}
