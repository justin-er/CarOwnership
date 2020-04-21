//
//  PersonViewModel.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct PersonViewModel {
    var birthdate:  String
    var name:       String
    private var formatString = "dd LL yyyy"
    
    init(person: Person) {
        self.birthdate =    getBirthdate(from: person.birthdate)
        self.name =         person.name
    }
    
    func getBirthdate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.string(from: date)
    }
    
    func makePerson() -> Person {
        let person = Person(birthdate: <#T##Date#>,
                            name: <#T##String#>)
    }
}
