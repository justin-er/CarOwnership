//
//  EditMileagePresenterInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol EditMileageInteractorInput {
    
	func getCar(with modelID: String)
    func updateCar(with modelID: String, by car: CarViewModel)
}
