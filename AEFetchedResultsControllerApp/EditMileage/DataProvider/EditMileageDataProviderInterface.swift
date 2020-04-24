//
//  EditMileageDataProviderInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol EditMileageDataProviderInterface {
    
    func object(by url: URL) -> Car?
    func updateObject(with url: URL, by car: Car)
}
