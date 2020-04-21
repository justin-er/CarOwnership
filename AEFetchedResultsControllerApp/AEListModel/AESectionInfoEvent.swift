//
//  AESectionInfoEvent.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct AESectionInfoEvent {
    var didInsertSections =   [AESectionInfoChange]()
    var didDeleteSections =   [AESectionInfoChange]()
    var didUpdateSections =   [AESectionInfoChange]()
    var didMoveSections =     [AESectionInfoMove]()
}
