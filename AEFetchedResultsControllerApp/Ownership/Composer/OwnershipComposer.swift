//
//  OwnershipComposer.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import UIKit

class OwnershipComposer {
    
    static func makeModule() -> OwnershipTableViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ownershipViewController = storyboard.instantiateViewController(identifier: "OwnershipTableViewController") as! OwnershipTableViewController
        
        
        let ownershipPreseneter         = OwnershipPresenter()
        let ownershipDataProvider       = OwnershipDataProvider()
        
        ownershipViewController.presenter   = ownershipPreseneter as OwnershipPresenterInterface
        ownershipPreseneter.delegate        = ownershipViewController as OwnershipPresenterDelegate
        ownershipPreseneter.dataProvider    = ownershipDataProvider as OwnershipDataProviderInterface
        ownershipDataProvider.delegate      = ownershipPreseneter
        
        return ownershipViewController
    }
}
