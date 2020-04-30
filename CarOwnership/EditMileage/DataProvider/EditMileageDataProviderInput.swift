//
//  EditMileageDataProviderInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol EditMileageDataProviderInput {
    
	func getCar(by modelID: String) -> Car?
    func updateObject(with modelID: String, by car: Car)
}
