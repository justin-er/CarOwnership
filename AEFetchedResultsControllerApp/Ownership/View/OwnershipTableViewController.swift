//
//  TableViewController.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class OwnershipTableViewController: UITableViewController {

	var interactor: OwnershipInteractorInput?
	private weak var presenter: OwnershipPresenterInput?
	
    var isVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        interactor?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isVisible = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.isVisible = false
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		print(presenter?.numberOfSections ?? 0)
        return presenter?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else { return 0 }
        return presenter.numberOfRowsInSection(at: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarOwnerCell", for: indexPath) as! CarOwnerCell

        guard let presenter = self.presenter else {
            return cell
        }
        
        let ownership = presenter.object(at: indexPath)
        cell.car.text = ownership.car.model
        cell.manufacturer.text = ownership.car.manufacturer.name
        cell.mileage.text = "\(ownership.car.mileage)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.sectionName(at: section)
    }

    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {[weak self] _, _, completion in
			self?.interactor?.deleteObject(at: indexPath)
            completion(true)
        })
        
        let editAction = UIContextualAction(style: .normal, title: "Edit", handler: {[weak self] _, _, completion in
            guard let presenter = self?.presenter else {
                completion(false)
                return
            }
            
            guard let objectModelID = presenter.objectModelId(at: indexPath).carModelId else {
                completion(false)
                return
            }
            
            guard let self = self else {
                completion(false)
                return
            }
            
			EditMileageComposer.show(source: self, carModelID: objectModelID)
            completion(true)
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK:- OwnershipPresenterDelegate
extension OwnershipTableViewController: OwnershipPresenterDelegate {
    
    func presenterDidReloadData(_ presenter: OwnershipPresenterInput) {
		
		self.presenter = presenter
        tableView.reloadData()
    }
    
    func presenterDidFilterData(_ presenter: OwnershipPresenterInput) {
		
		self.presenter = presenter
        tableView.reloadData()
    }
    
    func presenterWillChangeContent(_ presenter: OwnershipPresenterInput) {
        
		self.presenter = presenter
		
		guard isVisible else { return }
        tableView.beginUpdates()
    }
    
    func presenter(_ presenter: OwnershipPresenterInput, didChange ownership: OwnershipViewModel?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
        
		self.presenter = presenter
		
        guard isVisible else { return }
        
        switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func presenterDidChangeSection(_ presenter: OwnershipPresenterInput, at sectionIndex: Int, for type: AEModelChangeType) {
        
		self.presenter = presenter
		
        guard isVisible else { return }
        
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
    
    func presenterDidChangeContent(_ presenter: OwnershipPresenterInput) {
		
		self.presenter = presenter
		
        guard isVisible else { return }
        tableView.endUpdates()
    }
}
