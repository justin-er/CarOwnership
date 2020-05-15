# CarOwnership

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/CarOwnership-919x620.png)

This project has been created to show how to have an iOS application with clean architecture while we are using NSFetchedResultsController.

Probably the NSFetchedResutlsController makes the tightest coupling between UI and another layers of an iOS application. NSFetchedResutlsController Class has been created by Apple to provide a seamless data flow from Core Data layer to UIKit and vice a versa. The MVC is Apple’s native architecture and NSFetchedResultsController lays in the Model layer of this architecture perfectly but it cannot provide features like unit testing, low coupling, and independency. You might say that the lack of these possibilities is due to the MVC’s nature. I would answer yes, but these features are very important for having a well-structured application that is readable, testable, maintainable, and extendable. So if you value these traits, you do not have any problems with having some more small files in your project and you love Clean Architecture, keep on reading this article.

The main goal is using Core Data and UIKit frameworks in an application with clean architecture. To be clear, none of the modules on the inner layers should depend on the modules on the outer layers, furthermore, all modules should depend only on protocols. Only for memorising clean architecture I added it hear form Uncle Bob’s Clean Architecture book:

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/Clean-Architecture-Layers.png)

Hereafter I will call NSFetchedResultsController “Nfc” for the sake of simplicity.

To begin with, let’s tell you that I have tested different programming methods like extending the Nfc class and defining generic protocols for generalizing my solution, but finally, I concluded that the best way is to keep it as simple as possible. To do so, I create a wrapper around Nfc which is called data provider. The Data provider is a place that all database interactions happen there. In fact, it is the only class in the app that imports the CoreData framework. It is a good sign of decoupling. To do that, the data provider conforms to two protocols and depends on another protocol as a delegate. Let’s explain that by a simple application which is called CarOwnership.

There are four entities in the app. I mean by the entity phrase, the entities that are explained in the clean architecture. So those are the enterprise-wide objects and place in the innermost layer of the clean architecture circles. So these four entities are Person, Car, Manufacturer, and Ownership. There are four swift structs with the same names to simulate these entities in the app. To explain the relationships briefly, each Car should have a Manufacturer and each Person can have nothing, one or more Cars. And finally, each Ownership document shows the details of a car that belongs to a person. Ownership application easily shows ownership documents in a table view in the first scene which is sectioned by the name of the owners. The app also persists the data using three managed objects which are called ManagedPerson, ManagedCar, and ManagedManufacturer using Core Data.

The app also contains five main modules. View, Interactor, Data Provider, Presenter, and Composer. The names are self-descriptive but I’d like to point that the composer is responsible for both composing and navigation. Even though it might be controversial, I like this idea and it is not the main point in this article. The following graph illustrates the control flow between these modules.

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/Control-Flow.png)

The following UML class diagram also shows the modules in more details:

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/Ownership-Architectue-1024x662.png)

## Data Provider
The ownership data provider is a wrapper around Nfc in which all core data interactions happen and it implements two protocols which I mentioned earlier:

* OwnershiopDataSource
* OwnershipDataProviderInput

The OwnershipDataSource defines all the services that the data provider should provide for the presenter to act as a data source for representing data. Implementing these properties and methods is pretty straight forward because almost all of them have Nfc counterparts.

```Swift 
protocol OwnershipDataSource: class {
	
    var objects: [Ownership]? { get }
    func object(at indexPath: IndexPath) -> Ownership
    func objectModelId(at indexPath: IndexPath) -> (ownerModelId: String?, carModelId: String?, manufacturerModelId: String?)
    
    var sectionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
}
```
The second one, the OwnershipDataProviderInput, defines the services that the data provider should provide for the interactor to implement its business logic which differs from app to app.

```Swift
protocol OwnershipDataProviderInput: OwnershipDataSource  {
    
    func relaodData()
	func deleteObject(object: Ownership)
	func deleteObject(at indexPath: IndexPath)
    func updateObject(at indexPath: IndexPath, by data: Ownership)
    func insertObject(by data: Ownership)
}
```
The Data provider also has a delegate of type OwnershipDataProviderDelegate protocol that informs interactor about the completion of actions and data changes. As you can see the last four functions have counterparts in NSFetchedResultsControllerDelegate. Note that there are two main differences between OwnershipDataProviderDelegate and NSFetchedResultsControllerDelegate protocols. The Nfc delegate’s didChange anObject call back sends objects of type Any while data provider delegate’s callback delivers objects of type Ownership to the interactor, which is an app entity. The other difference is the type of changes in the callbacks. In the Nfc’s delegate, it is NSFetchedResultsChangeType while in the data provider delegate it is of type AEModelChangeType, which is an enumeration defined in the app.

These two important changes help the app architecture to comply with the dependency inversion rule of the SOLID principles.

## Interactor
The interactor depends on the OwnershipDataProviderInput and OwnershipDataSource protocols which are implemented by the data provider and explained above. The interactor also acts as a delegate for the data provider. As you see in the interactor class, in this example, it only delivers these callbacks directly to the presenter, to inform it about data changes but the interactor has complete control over it. It can implement any business logic and change data before propagating that to the presenter. Another important note is that during redirecting the data from provider callbacks to the presenter input by the interactor, the ownership data source is also passed. The presenter uses this data source to respond to the receiving table view or collection view requests from the view controller.

```Swift
extension OwnershipInteractor: OwnershipDataProviderDelegate {
	
	func providerDidReloadData(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorDidReloadData(self, source: provider)
	}
	
	func providerDidFilterData(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorDidFilterData(self, source: provider)
	}
	
	func providerWillChangeContent(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorWillChangeContent(self, source: provider)
	}
	
	func provider(_ provider: OwnershipDataProviderInput, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
		presenter?.interactor(self, source: provider, didChange: ownership, at: indexPath, for: type, newIndexPath: newIndexPath)
	}
	
	func providerDidChangeSection(_ provider: OwnershipDataProviderInput, at sectionIndex: Int, for type: AEModelChangeType) {
		presenter?.interactorDidChangeSection(self, source: provider, at: sectionIndex, for: type)
	}
	
	func providerDidChangeContent(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorDidChangeContent(self, source: provider)
	}
}
```
Interactor also conforms to the OwnershipInteractorInput to act as a use case for the view controller and fulfilling its requirements.

## Presenter
The presenter conforms to the OwnershipPresentInput. The interactor uses this interface to inform the presenter about the data changes. The presenter also depends on a delegate of type OwnershipPresenterDelegate which is implemented by the view controller. The presenter uses this delegate to inform the view controller about the data changes. There are again two notes. First, the presenter receives data of type Ownership form the interactor then maps it to the OwnershipViewModel and passes it to the view layer. The second note is that the presenter also passes itself as an OwnsershipViewModelDataSource instance to the view layer. In fact, the view controller uses this instance to respond to the table or collection view requests like the numberOfSections or the cellForRowAt requests. If you look at it deeply, you will see that when the view controller asks for some data from the OwnershipVieModelDataSource, for example by calling the numberOfRowsInSection method, this request is redirected to the interactor and then to the data provider and finally will be handled by the Nfc itself. So we can say we have access to most of the Nfc features within a clean architecture. Thus we have access to all features of the clean architecture, important abilities like reusability, maintainability, testability, readability, and modularity.

That is all about it. I agree that there more files in the project rather than using pure MVC. But I think this overhead really worth it because we are achieving very important results.




