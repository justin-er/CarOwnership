//
//  DBProviderDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol DBProviderDelegate {
    
    func providerWillChangeContent(_ provider: DBProviderInterface, dataModel: OwnershipListProvider)
}
