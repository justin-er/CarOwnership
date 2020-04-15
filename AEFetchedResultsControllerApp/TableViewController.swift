//
//  TableViewController.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var context = DBManager.shared.context
    var frc: NSFetchedResultsController<Car>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Car.owner.name), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                         managedObjectContext: context,
                                         sectionNameKeyPath: #keyPath(Car.owner.name),
                                         cacheName: nil)
        frc.delegate = self
        
        do {
            try frc.performFetch()
            tableView.reloadData()
            initializeDatabase()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return frc.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = frc.sections else {
            return 0
        }
        let section = sections[section]
        return section.numberOfObjects
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarOwnerCell", for: indexPath) as! CarOwnerCell

        let car = frc.object(at: indexPath)
        cell.car.text = car.model
        cell.mileage.text = "\(car.mileage)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = frc.sections else {
            return ""
        }
        
        return sections[section].name
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initializeDatabase() {
        print(frc.sections!.count)
        guard frc.sections?.count == 0 else { return }
        
        //Amir
        let amir =      Person(context: context, name: "Amir", age: 41, cars: nil)
        let _ =         Car(contex: context, model: "Picanto", mileage: 32000, owener: amir)
        let _ =         Car(contex: context, model: "Corrola", mileage: 800, owener: amir)
        
        //David
        let porche =    Car(contex: context, model: "911 Turbo", mileage: 256000, owener: nil)
        let bmw =       Car(contex: context, model: "328 M3", mileage: 22000, owener: nil)
        let _ =         Person(context: context, name: "David", age: 39, cars: [porche, bmw])
        
        DBManager.shared.saveContext()
        
    }
}

//MARK: - NSFetchedResltsControllerDelegate
extension TableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .update:
            tableView.reloadSections(IndexSet([sectionIndex]), with: .automatic)
        case .delete:
            tableView.deleteSections(IndexSet([sectionIndex]), with: .automatic)
        case .insert:
            tableView.insertSections(IndexSet([sectionIndex]), with: .automatic)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
