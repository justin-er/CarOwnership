////
////  AEFetchedResultsController.swift
////  AEFetchedResultsControllerApp
////
////  Created by Amirreza Eghtedari on 15.04.20.
////  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//class AEFetchedResultsController<Converter, ModelType: Equatable>: NSFetchedResultsController<NSFetchRequestResult> where Converter: AEModelConverter, Converter.Source == NSFetchRequestResult, Converter.Result == ModelType {
//
//    let converter: Converter
//    
//    init(fetchRequest: NSFetchRequest<NSFetchRequestResult>, managedObjectContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName name: String?, converter: Converter) {
//        
//        self.converter = converter
//        
//        super.init(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: name)
//    }
//}
//
//extension AEFetchedResultsController: AEListModelProvider {
//    typealias Model = ModelType
//    
//    var modelObjects: [ModelType]? {
//        guard let objects = self.fetchedObjects else {
//            return nil
//        }
//        
//        return objects.compactMap { item in
//            return converter.convert(item)
//        }
//    }
//    
//    var modelSections: [AEListModelSectionInfo]? {
//        self.sections as? [AEListModelSectionInfo]
//    }
//    
//    var modelSctionIndexTitles: [String] {
//        self.sectionIndexTitles
//    }
//    
//    func modelSection(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int {
//        self.section(forSectionIndexTitle: title, at: sectionIndex)
//    }
//    
//    func modelSectionIndexTitle(forSectionName sectionName: String) -> String? {
//        self.sectionIndexTitle(forSectionName: sectionName)
//    }
//
////    func modelObject(at indexPath: IndexPath) -> ModelType {
////        object = self.object(at: indexPath)
////        return self.converter.convert(object)
////    }
//    
//    func indexPath(forModelObject object: ModelType) -> IndexPath? {
//        guard let fetchedObjects = self.fetchedObjects else {
//            return nil
//        }
//        
////        for fetchedObject in fetchedObjects {
////            let model: ModelType = converter.convert(fetchedObject)
////            if model == object {
////                return self.indexPath(forObject: fetchedObject)
////            }
////        }
//        
//        return nil
//    }
//    
//}
//
//
//
//
//
