//
//  AESectionInfoEvent.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct AESectionInfoEvent<AESectionInfo> {
    var didInsertSections =   [AESectionInfoChange<AESectionInfo>]()
    var didDeleteSections =   [AESectionInfoChange<AESectionInfo>]()
    var didUpdateSections =   [AESectionInfoChange<AESectionInfo>]()
    var didMoveSections =     [AESectionInfoMove<AESectionInfo>]()
}
