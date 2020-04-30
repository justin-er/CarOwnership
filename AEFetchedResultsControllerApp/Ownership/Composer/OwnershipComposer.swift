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
        
        let storyboard = UIStoryboard(name: "Ownership", bundle: nil)
        let ownershipViewController = storyboard.instantiateViewController(identifier: "OwnershipTableViewController") as! OwnershipTableViewController
        
		let interactor		= OwnershipInteractor()
        let presenter       = OwnershipPresenter()
        let dataProvider    = OwnershipDataProvider()
        
        ownershipViewController.interactor	= interactor as OwnershipInteractorInput
		interactor.presenter 		= presenter as OwnershipPresenterInput
		interactor.dataProvider		= dataProvider as OwnershipDataProviderInput
		dataProvider.delegate 		= interactor as OwnershipDataProviderDelegate
        presenter.delegate        	= ownershipViewController as OwnershipPresenterDelegate
        
        return ownershipViewController
    }
}
