//
//  EditMileagePresenterInput.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 30.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol EditMileagePresenterInput {
	
	func didGet(_ interactor: EditMileageInteractorInput, car: Car) 
}
