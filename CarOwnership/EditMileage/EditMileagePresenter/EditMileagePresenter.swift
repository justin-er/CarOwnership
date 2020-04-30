//
//  EditMileagePresenter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 30.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class EditMileagePresenter: EditMileagePresenterInput {
	
	weak var delegate: EditMileagePresenterDelegate?
	
	func didGet(_ interactor: EditMileageInteractorInput, car: Car) {
		delegate?.didGet(self, car: CarViewModel(by: car))
	}
	
}
