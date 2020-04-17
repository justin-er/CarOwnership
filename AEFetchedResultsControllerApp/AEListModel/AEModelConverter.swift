//
//  AEResultTypeConverter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 15.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol AEModelConverter {
    associatedtype Source
    associatedtype Result
    
    func convert(_ source: Source) -> Result?
}
