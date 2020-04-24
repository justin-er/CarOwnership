//
//  EditMileagePresenterInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol EditMileagePresenterInterface {
    
    func object(by url: URL) -> CarViewModel?
    func updateObject(with url: URL, by car: CarViewModel)
}
