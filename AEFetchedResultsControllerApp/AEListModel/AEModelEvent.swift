//
//  AEModelChangeEventType.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct AEModelEvent<Model> {
    var didInsertModels =   [AEModelChange<Model>]()
    var didDeleteModels =   [AEModelChange<Model>]()
    var didUpdateModels =   [AEModelChange<Model>]()
    var didMoveModels =     [AEModelMove<Model>]()
}

